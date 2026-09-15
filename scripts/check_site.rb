# frozen_string_literal: true

# Validate the generated bilingual site without fetching external destinations.
require 'json'
require 'nokogiri'
require 'pathname'
require 'uri'

root = Pathname.new(ARGV.fetch(0, '_site')).expand_path
abort "Build the site first: #{root} is missing" unless root.directory?
errors = []
documents = {}
root.glob('**/*.html').each do |path|
  documents[path] = Nokogiri::HTML(path.read)
end

documents.each do |path, document|
  relative = path.relative_path_from(root)
  errors << "#{relative}: missing page title" if document.at_css('title')&.text.to_s.strip.empty?
  errors << "#{relative}: missing language" unless %w[en ja].include?(document.at_css('html')&.[]('lang'))
  errors << "#{relative}: unresolved template" if document.text.match?(/\{\{[<%]|Liquid Exception/)

  document.css('a[href], link[href], img[src], script[src]').each do |element|
    value = element['href'] || element['src']
    next if value.to_s.empty? || value.start_with?('mailto:', 'tel:', 'data:', '//')
    begin
      uri = URI.parse(value)
      next if uri.host && !%w[hirotakahiraki.github.io localhost 127.0.0.1].include?(uri.host)
      next if uri.scheme && !%w[http https].include?(uri.scheme)
      url_path = URI::DEFAULT_PARSER.unescape(uri.path)
      target = if url_path.empty?
                 path
               elsif url_path.start_with?('/')
                 root.join(url_path.delete_prefix('/'))
               else
                 path.dirname.join(url_path)
               end
      target = target.join('index.html') if target.directory?
      target = target.cleanpath
      unless target.file?
        errors << "#{relative}: missing local target #{value}"
        next
      end
      if uri.fragment && !uri.fragment.empty? && target.extname == '.html'
        destination = documents[target] ||= Nokogiri::HTML(target.read)
        fragment = URI::DEFAULT_PARSER.unescape(uri.fragment)
        unless destination.css('[id], a[name]').any? { |node| node['id'] == fragment || node['name'] == fragment }
          errors << "#{relative}: missing anchor #{value}"
        end
      end
    rescue URI::InvalidURIError => exception
      errors << "#{relative}: invalid URL #{value.inspect}: #{exception.message}"
    end
  end
end

publications = JSON.parse(File.read('_data/publications.json'))
profiles = JSON.parse(File.read('_data/profile.json'))
news = JSON.parse(File.read('_data/news.json'))
errors << 'Source Word and LaTeX documents must not be published' unless root.glob('**/*').none? { |path| %w[.docx .tex].include?(path.extname.downcase) || path.basename.to_s.end_with?('.tex.txt') }
errors << 'News must be ordered newest first' unless news.map { |item| item['date'] } == news.map { |item| item['date'] }.sort.reverse
%w[en ja].each do |lang|
  prefix = lang == 'ja' ? 'ja/' : ''
  %w[index.html projects/index.html publications/index.html].each do |route|
    path = root.join(prefix + route)
    document = documents[path]
    if document.nil?
      errors << "Missing required page: #{prefix}#{route}"
      next
    end
    errors << "#{prefix}#{route}: incorrect language" unless document.at_css('html')['lang'] == lang
    errors << "#{prefix}#{route}: missing translated page link" unless document.css('.language-navigation a').size == 2
  end
  archive = documents[root.join(prefix + 'publications/index.html')]
  expected = publications[lang].values.sum { |section| section['groups'].sum { |group| group['items'].size } }
  errors << "#{lang}: publication count differs from source (#{expected})" unless archive&.css('[data-publication]')&.size == expected
  home = documents[root.join(prefix + 'index.html')]
  errors << "#{lang}: awards missing from profile" unless home&.css('#awards .award-list > li')&.size == profiles[lang]['awards'].size
  %w[experience education support].each do |section|
    errors << "#{lang}: #{section} missing from profile" unless home&.css("##{section} .profile-timeline > div")&.size == profiles[lang][section].size
  end
  expected_navigation = ["/#{prefix}", "/#{prefix}publications/", "/#{prefix}projects/"]
  navigation = home&.css('#site-nav .masthead__menu-item:not(.masthead__menu-item--lg) a')&.map { |link| link['href'] }
  errors << "#{lang}: navigation must contain Profile, Publications, and Projects" unless navigation == expected_navigation
  %w[experience awards].each do |section|
    redirect = documents[root.join(prefix + "#{section}/index.html")]
    destination = URI.parse(redirect&.at_css('meta[http-equiv="refresh"]')&.[]('content').to_s.delete_prefix('0; url='))
    errors << "#{lang}: #{section} must redirect to its profile section" unless destination.path == "/#{prefix}" && destination.fragment == section
    errors << "#{lang}: #{section} redirect has incorrect language" unless redirect&.at_css('html')&.[]('lang') == lang
  end
  entries = home&.css('#news [data-news]')
  errors << "#{lang}: news missing or out of order" unless entries&.map { |entry| entry['data-news'] } == news.map { |item| item['id'] }
  errors << "#{lang}: news translation missing" if news.any? { |item| item[lang].to_s.strip.empty? }
  %w[whispermask emask epose silentmask yura].each do |slug|
    project = documents[root.join(prefix + "project/#{slug}/index.html")]
    unless project && project.at_css('meta[property="og:image"]')&.[]('content')&.include?("projects/#{slug}.jpg")
      errors << "#{lang}: missing project or project-specific preview for #{slug}"
    end
  end
end

abort errors.join("\n") unless errors.empty?
puts "Validated #{documents.size} pages: bilingual routes, news, publications, awards, research support, local links, assets, project previews, and source document exclusions."
