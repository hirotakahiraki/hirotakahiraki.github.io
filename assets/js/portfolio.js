(() => {
  'use strict';
  const themeToggle = document.querySelector('#theme-toggle a');
  themeToggle?.addEventListener('keydown', event => {
    if (event.key === 'Enter' || event.key === ' ') { event.preventDefault(); themeToggle.click(); }
  });
  const controls = document.querySelector('.publication-controls');
  if (!controls) return;
  const search = controls.querySelector('input[type="search"]');
  const filters = [...controls.querySelectorAll('[data-filter]')];
  const entries = [...document.querySelectorAll('[data-publication]')];
  const count = document.querySelector('[data-result-count]');
  const empty = document.querySelector('.empty-results');
  const params = new URLSearchParams(location.search);
  let category = filters.some(filter => filter.dataset.filter === params.get('category')) ? params.get('category') : 'all';
  search.value = params.get('q') || '';
  const update = () => {
    const query = search.value.trim().toLocaleLowerCase();
    let visible = 0;
    entries.forEach(entry => {
      const match = (category === 'all' || entry.dataset.category === category) && entry.textContent.toLocaleLowerCase().includes(query);
      entry.hidden = !match;
      if (match) visible++;
    });
    document.querySelectorAll('[data-publication-section], [data-publication-group]').forEach(section => {
      section.hidden = ![...section.querySelectorAll('[data-publication]')].some(entry => !entry.hidden);
    });
    filters.forEach(filter => filter.setAttribute('aria-pressed', String(filter.dataset.filter === category)));
    count.textContent = String(visible);
    empty.hidden = visible > 0;
    const url = new URL(location.href);
    if (search.value) url.searchParams.set('q', search.value); else url.searchParams.delete('q');
    if (category !== 'all') url.searchParams.set('category', category); else url.searchParams.delete('category');
    history.replaceState(null, '', url);
    document.querySelectorAll('.language-navigation a').forEach(link => {
      const destination = new URL(link.href);
      destination.search = url.search;
      link.href = destination.href;
    });
  };
  search.addEventListener('input', update);
  filters.forEach(filter => filter.addEventListener('click', () => { category = filter.dataset.filter; update(); }));
  document.querySelector('.reset-filters').addEventListener('click', () => { category = 'all'; search.value = ''; update(); search.focus(); });
  controls.hidden = false;
  update();
})();
