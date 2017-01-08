$(document).ready(function() {

    var owls = document.getElementsByClassName("owl-carousel");
        for (var i = 0; i < owls.length; i++) {
            $(".owl-carousel", i).owlCarousel({
            items: 3, //10 items above 1000px browser width
            itemsDesktop: [1000, 5], //5 items between 1000px and 901px
            itemsDesktopSmall: [900, 3], // betweem 900px and 601px
            itemsTablet: [600, 2], //2 items between 600 and 0
            itemsMobile: false // itemsMobile disabled - inherit from itemsTablet option
        });

            $(".owl-carousel", i).trigger('owl.play', 3000); //owl.play event accept autoPlay speed as second parameter

    }
});