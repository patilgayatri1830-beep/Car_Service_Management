function searchService()
{
    let input = document.getElementById("search").value.toLowerCase();

    let cards = document.querySelectorAll(".card");

    cards.forEach(function(card)
    {
        let text = card.innerText.toLowerCase();

        if(text.indexOf(input) > -1)
        {
            card.style.display="block";
        }
        else
        {
            card.style.display="none";
        }
    });
}