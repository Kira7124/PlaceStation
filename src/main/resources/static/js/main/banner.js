    var currentSlide = 1;

    function changeSlide(nextSlideId) {
        document.getElementById('slide0' + currentSlide).checked = false;
        document.getElementById(nextSlideId).checked = true;
        currentSlide = parseInt(nextSlideId.slice(-1));
    }

    setInterval(function() {
        var nextSlideId = 'slide0' + ((currentSlide % 5) + 1);
        changeSlide(nextSlideId);
    }, 3000);