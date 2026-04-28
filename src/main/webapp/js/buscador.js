document.addEventListener("DOMContentLoaded", () => {

    const buscadores = document.querySelectorAll(".user-search");

    buscadores.forEach((input) => {

        input.addEventListener("keyup", () => {

            const filtro = input.value.toLowerCase();

            // Buscar el contenedor padre grande (grid)
            const contenedor = input.closest(".grid-content, .grid-content-alerts, .grid-content-usuario, .grid-content-departamento");

            if (!contenedor) return;

            // Buscar TODAS las tablas dentro de ese módulo
            const tablas = contenedor.querySelectorAll(".table");

            tablas.forEach((tabla) => {

                const filas = tabla.querySelectorAll(".tr-table");

                filas.forEach((fila) => {

                    const textoFila = fila.textContent.toLowerCase();

                    if (textoFila.includes(filtro)) {
                        fila.style.display = "";
                    } else {
                        fila.style.display = "none";
                    }

                });

            });

        });

    });

});