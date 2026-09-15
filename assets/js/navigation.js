const navigation = document.querySelector('.site-navigation');
const toggle = navigation.querySelector('.navigation-toggle');
const compact = window.matchMedia('(max-width: 767px)');

function closeNavigation() {
  toggle.setAttribute('aria-expanded', 'false');
}

toggle.addEventListener('click', () => {
  toggle.setAttribute('aria-expanded', String(toggle.getAttribute('aria-expanded') !== 'true'));
});
document.addEventListener('click', (event) => {
  if (!navigation.contains(event.target)) closeNavigation();
});
document.addEventListener('keydown', (event) => {
  if (event.key === 'Escape' && toggle.getAttribute('aria-expanded') === 'true') {
    closeNavigation();
    toggle.focus();
  }
});
navigation.addEventListener('focusout', (event) => {
  if (!navigation.contains(event.relatedTarget)) closeNavigation();
});
navigation.querySelectorAll('a').forEach((link) => link.addEventListener('click', closeNavigation));
compact.addEventListener('change', closeNavigation);

// Keep content below the fixed header, including when text wraps or is zoomed.
const masthead = document.querySelector('.masthead');
new ResizeObserver(() => {
  document.body.style.paddingTop = `${masthead.getBoundingClientRect().height}px`;
}).observe(masthead);
