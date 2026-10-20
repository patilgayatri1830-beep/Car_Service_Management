const menu = document.getElementById("menu-toggle");

const navMenu = document.getElementById("navLinks");

menu.onclick = function(){

    navMenu.classList.toggle("active");

}
window.onload=function()
{
    console.log("AutoCare Pro Loaded Successfully");
}

/* Smooth Scroll */

document.querySelectorAll('a[href^="#"]').forEach(anchor=>{

anchor.addEventListener("click",function(e){

e.preventDefault();

document.querySelector(this.getAttribute("href"))
.scrollIntoView({

behavior:"smooth"

});

});

});


/* Scroll To Top Button */

let topBtn=document.getElementById("topBtn");

window.onscroll=function()
{
    if(topBtn!=null)
    {
        if(document.body.scrollTop>300 || document.documentElement.scrollTop>300)
        {
            topBtn.style.display="block";
        }
        else
        {
            topBtn.style.display="none";
        }
    }
}

function topFunction()
{
    window.scrollTo({
        top:0,
        behavior:"smooth"
    });
}
