const hero = document.querySelector(".hero");

const images = [

"images/car.jpg",

"images/car5.jpg",

"images/banner1.jpg",

"images/car3.jpg",

"images/oil.png"

];

let current = 0;

function changeBackground()
{
    current++;

    if(current >= images.length)
    {
        current = 0;
    }

    hero.style.backgroundImage = "url('" + images[current] + "')";

    hero.style.backgroundSize = "cover";
    hero.style.backgroundPosition = "center";
    hero.style.transition = "1s";
}

setInterval(changeBackground,4000);