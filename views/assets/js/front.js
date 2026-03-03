(function () {
  'use strict';

  function parseMoney(s) {
    if (!s && s !== 0) return NaN;
    return parseFloat(String(s).replace(/\s/g, '').replace(/[^\d,.\-]/g, '').replace(',', '.'));
  }

  function recalcWrap(wrapper) {
    const fill  = wrapper.querySelector('.ifdc-fill');
    const badge = wrapper.querySelector('.ifdc-badge');
    const progressBar = wrapper.querySelector('.ifdc-progress');
    const priceEl = wrapper.querySelector('.ifdc-remaining-price');
    if (!fill || !badge || !progressBar) return;

    let remaining = parseMoney(wrapper.getAttribute('data-remaining'));
    let threshold = parseMoney(wrapper.getAttribute('data-threshold'));
    if (!isFinite(threshold) && typeof window.iqitfdc_from !== 'undefined') {
      threshold = parseMoney(window.iqitfdc_from);
    }
    if (!isFinite(remaining) && priceEl) {
      remaining = parseMoney(priceEl.textContent);
    }

    if (!isFinite(threshold) || threshold <= 0) return;

    let progress = (threshold - remaining) / threshold;
    progress = Math.max(0, Math.min(1, progress));
    const pct = progress * 100;

    // Dynamiczny margines zależny od szerokości badge, żeby nie wychodził poza pasek.
    const barWidth = progressBar.offsetWidth;
    const badgeHalf = badge.offsetWidth / 2;
    let edgePad = 1.5;
    if (barWidth > 0 && badgeHalf > 0) {
      edgePad = Math.min(49.5, (badgeHalf / barWidth) * 100);
    }
    const targetSafe = Math.max(edgePad, Math.min(100 - edgePad, pct));

    // poprzednia pozycja z data-prev-pct
    const prevPct = parseFloat(wrapper.getAttribute('data-prev-pct')) || edgePad;

    // ustaw startową pozycję bez animacji
    badge.style.transition = 'none';
    fill.style.transition = 'none';
    badge.style.left = prevPct + '%';
    fill.style.width = prevPct + '%';

    // wymuś reflow i animuj do nowej pozycji
    void badge.offsetWidth;
    badge.style.transition = 'left .55s ease-in-out';
    fill.style.transition = 'width .55s ease-in-out';
    badge.style.left = targetSafe + '%';
    fill.style.width = pct + '%';

    // zapisz nową pozycję do wrappera
    wrapper.setAttribute('data-prev-pct', targetSafe.toFixed(2));

  }

  function recalcAll() {
    document.querySelectorAll('.iqitfreedeliverycount-wrapper').forEach(recalcWrap);
  }

  document.addEventListener('DOMContentLoaded', function () {
    recalcAll();

    if (window.prestashop && typeof window.prestashop.on === 'function') {
      prestashop.on('updatedCart', function () {
        setTimeout(recalcAll, 80);
      });
    }

    if (typeof window.$ !== 'undefined') {
      $(document).on('updatedCart', function () {
        setTimeout(recalcAll, 80);
      });

      // wspiera moduł koszyka wysuwanego (offcanvas/sidebar)
      $(document).on('shown.bs.modal shown.bs.collapse shown.bs.offcanvas', function () {
        setTimeout(recalcAll, 80);
      });
    }

    // fallback dla kliknięć w koszyku
    document.body.addEventListener('click', function (e) {
      const inc = e.target.closest('.js-increase-product-quantity, .cart_quantity_up');
      const dec = e.target.closest('.js-decrease-product-quantity, .cart_quantity_down');
      const rmv = e.target.closest('.cart__remove, .remove-from-cart');
      if (inc || dec || rmv) setTimeout(recalcAll, 400);
    });

    // Recalc po dynamicznym podmianiu DOM (np. moduł w wysuwanym koszyku).
    if (typeof MutationObserver !== 'undefined') {
      const observer = new MutationObserver(function (mutations) {
        let shouldRecalc = false;
        mutations.forEach(function (mutation) {
          if (mutation.type === 'childList' && mutation.addedNodes.length) {
            mutation.addedNodes.forEach(function (node) {
              if (node.nodeType !== 1 || shouldRecalc) return;
              if (
                (node.matches && node.matches('.iqitfreedeliverycount-wrapper')) ||
                (node.querySelector && node.querySelector('.iqitfreedeliverycount-wrapper'))
              ) {
                shouldRecalc = true;
              }
            });
          }
        });

        if (shouldRecalc) {
          setTimeout(recalcAll, 80);
        }
      });

      observer.observe(document.body, { childList: true, subtree: true });
    }
  });
})();
