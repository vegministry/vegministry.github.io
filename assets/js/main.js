!function (o) { "use strict"; setTimeout(function () { o("#spinner").length > 0 && o("#spinner").removeClass("show") }, 1), new WOW().init(), o(window).scroll(function () { o(this).scrollTop() > 660 ? o(".navbar").addClass("sticky-top shadow-lg") : o(".navbar").removeClass("sticky-top shadow-sm") }); let t = o(".dropdown"), n = o(".dropdown-toggle"), e = o(".dropdown-menu"), s = "show"; o(window).on("load resize", function () { this.matchMedia("(min-width: 992px)").matches ? t.hover(function () { let t = o(this); t.addClass(s), t.find(n).attr("aria-expanded", "true"), t.find(e).addClass(s) }, function () { let t = o(this); t.removeClass(s), t.find(n).attr("aria-expanded", "false"), t.find(e).removeClass(s) }) : t.off("mouseenter mouseleave") }), o(window).scroll(function () { o(this).scrollTop() > 500 ? o(".back-to-top").fadeIn("slow") : o(".back-to-top").fadeOut("slow") }), o(".back-to-top").click(function () { return o("html, body").animate({ scrollTop: 0 }, 1700, "easeInOutExpo"), !1 }), o('[data-toggle="counter-up"]').counterUp({ delay: 10, time: 2e3 }), o(document).ready(function () { 
    var t; o(".btn-play").click(function () { 
        
        const id = this.getAttribute('id');
        if (id==="videoNum0"){
            t = o(this).data("src")
        }else{
            var button = document.getElementById("videoNum0");
            var scrollPosition = window.scrollY;
            window.scrollTo(0, 0);

            button.scrollIntoView({ behavior: "smooth", block: "start", inline: "nearest" });
            var self = this
            t = o(button).data("src")
            setTimeout(function() {
                t = o(self).data("src")
                o("#video").attr("src", t + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0") 
                setTimeout(function() {
                o("#videoModal").hide();
                window.scrollTo(0, scrollPosition);
                o("#videoModal").show();
            }, 1000);
            }, 1000);
    }
    
    }),
     console.log(t), o("#videoModal").on("shown.bs.modal", function (n) {
        o("#videoModal").hide();
        window.scrollTo(0, 0);
        o("#video").attr("src", t + "?autoplay=1&amp;modestbranding=1&amp;showinfo=0") 
        o("#videoModal").show();
        }), 
         o("#videoModal").on("hide.bs.modal", function (n) { o("#video").attr("src", t) }) }), o(".testimonial-carousel").owlCarousel({ autoplay: !0, smartSpeed: 1e3, center: !0, margin: 24, dots: !0, loop: !0, nav: !1, responsive: { 0: { items: 1 }, 768: { items: 2 }, 992: { items: 3 } } }) }(jQuery);
