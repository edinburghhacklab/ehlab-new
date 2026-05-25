// hacklab-- for having js on our site.
// if you're adding something to this, please ensure the site is still usable without it, and
// try to avoid pulling in any libraries unless absolutely necessary.
// check the web baseline project for compatibility - we don't need the newest and shiniest,
// compatibility (incl with non-chromium browsers) is more important

// Add the date of our next open night to any #next-open-night elements
const excludedOpenNights = [
    new Date("2026-05-19").toDateString(),
    new Date("2026-05-26").toDateString(),
];
function nextOpenNight() {
    var today = new Date();
    var day = today.getDay();
    var tuesday = today.getDate() - day + (day === 0 ? -6 : 2);
    var tuesday = new Date(today.setDate(tuesday));
    while (excludedOpenNights.includes(tuesday.toDateString())) {
        tuesday.setDate(tuesday.getDate() + 7);
    }

    if (tuesday.toDateString() === today.toDateString()) {
        return "tonight";
    } else {
        const locale = 'en-GB',
            suffixMap = { one: 'st', two: 'nd', few: 'rd', other: 'th' },
            pluralRule = new Intl.PluralRules(locale, { type: 'ordinal', }),
            withOrdinal = (n) => `${n}${suffixMap[pluralRule.select(n)]}`,
            dateFmt = Intl.DateTimeFormat(locale, { month: 'long' }),
            formatDate = (date) => `${withOrdinal(date.getDate())} of ${dateFmt.format(date)}`;
        return formatDate(tuesday);
    }
}

(function() {
    var nextString = nextOpenNight();
    var nextOpenNightElement = document.getElementById('next-open-night');
    if (nextOpenNightElement)
        nextOpenNightElement.innerText = `Our next open night is on the ${nextString}.`;
})();

// Convert <gallery> tags into inline galleries
(function() {
    for (var el of document.querySelectorAll('gallery')) {
        // Collect all the child image tags, then clear the element and make an
        // inline gallery.
        // This is needed because lightgallery will append to the end of the element by default.
        // It also deals with the fact that in markdown, there will usually be some extra <p> tags lying around
        let imgs = Array.from(el.querySelectorAll('img'));
        el.innerHTML = '';
        var gallery = lightGallery(el, {
            container: el,
            closable: false,
            showMaximizeIcon: true,
            dynamic: true,
            keyPress: false,
            mousewheel: true,
            dynamicEl: imgs,
        })
        el.classList.add('active');
        gallery.openGallery();
    }
})();
