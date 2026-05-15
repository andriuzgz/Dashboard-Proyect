document.addEventListener("DOMContentLoaded", () => {

    const buttons = document.querySelectorAll(".button-nav");
    const path = window.location.pathname;

    buttons.forEach(btn => { const url = btn.getAttribute("data-url");

        if (path.includes(url)) {

            btn.classList.add("active");
        }
    });
});