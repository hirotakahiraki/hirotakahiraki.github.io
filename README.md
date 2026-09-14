# Hirotaka Hiraki / 平城裕隆

Bilingual researcher website built with [AcademicPages](https://github.com/academicpages/academicpages.github.io) and Jekyll.

This trial lives on `redesign/academicpages`. The original public site remains on `main`; the trial branch does not deploy to GitHub Pages.

## Local preview

Requires Ruby 3.2 and Bundler.

```sh
bundle config set --local path vendor/bundle
bundle install
bundle exec jekyll serve --livereload
```

- English: <http://localhost:4000/>
- 日本語: <http://localhost:4000/ja/>

## Editing content

| Content | Source |
| --- | --- |
| Profile and page introductions | `_pages/en/` and `_pages/ja/` |
| News (shared dates, English and Japanese text) | `_data/news.json` |
| Media coverage (dates, article URLs, localized titles and publishers) | `_data/media.json` |
| Sidebar identity and links | `_data/authors.json` |
| Projects and descriptions | `_projects/en/` and `_projects/ja/` |
| Publications (shared citation format, localized categories) | `_data/publications.json` |
| Education, experience, awards, grants and scholarships | `_data/profile.json` |
| Navigation and interface labels | `_data/navigation.json`, `_data/labels.json` |
| Personal style refinements | `_sass/_hiraki.scss` |
| Profile and project images | `images/` |
| CV (currently June 2024) | `assets/pdfs/Curriculum_Vitae_hirotakahiraki.pdf` |

Every translated page includes `translation_en` and `translation_ja`, so the language control opens the corresponding page. Existing `/project/<name>/` and `/ja/project/<name>/` URLs are retained.

Add news to `_data/news.json` in newest-first order. Each entry has a unique `id`, a `date` in `YYYY-MM` format, and `en` / `ja` text supporting Markdown links. The Profile shows all entries in a compact list. Dates are recorded to the month to match the precision of the source records.

The profile, current roles, and news were updated using the supplied achievement and study-abroad documents and public researchmap records. Editorial source notes are in `docs/profile-sources.md`. Local `.docx` source documents are ignored by Git and excluded from the generated website; keep the public CV in `assets/pdfs/`.

## Validation and publishing

```sh
JEKYLL_ENV=production bundle exec jekyll build
bundle exec ruby scripts/check_site.rb
```

GitHub Actions runs the same checks on the trial branch. Public deployment is restricted to `main`. Nothing is published just by previewing or committing locally.

## Theme provenance

The actual AcademicPages templates, Sass, JavaScript, icons, and fonts were imported from upstream commit `c77da751a8124450d5fb818056c0cf081fea08e1` (September 15, 2026). This is a Jekyll migration, with small additions for bilingual navigation, project cards, news, and media coverage. Publications are displayed directly by category. The Hugo implementation was removed from the trial branch.

Upstream license: `licenses/AcademicPages-MIT.txt`.
