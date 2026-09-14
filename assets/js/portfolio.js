(() => {
  'use strict';
  const themeToggle = document.querySelector('#theme-toggle a');
  themeToggle?.addEventListener('keydown', event => {
    if (event.key === 'Enter' || event.key === ' ') { event.preventDefault(); themeToggle.click(); }
  });
})();
