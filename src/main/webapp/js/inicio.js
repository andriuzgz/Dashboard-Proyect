document.addEventListener("DOMContentLoaded", () => {

    const buttons = document.querySelectorAll(".button:not(.salir)");
    const sections = document.querySelectorAll(".div-container");

    // recuperar sección guardada
    let active = localStorage.getItem("activeSection") || "inicio";

    // ocultar todo
    sections.forEach(sec => sec.hidden = true);

    // mostrar la correcta
    document.querySelector("." + active).hidden = false;

    // marcar botón activo
    buttons.forEach(btn => {
        if (btn.dataset.target === active) {
            btn.classList.add("active");
        }

        btn.addEventListener("click", () => {

            buttons.forEach(b => b.classList.remove("active"));
            btn.classList.add("active");

            sections.forEach(sec => sec.hidden = true);

            const target = btn.dataset.target;
            document.querySelector("." + target).hidden = false;

            // 🔥 guardar sección
            localStorage.setItem("activeSection", target);
        });
    });

});