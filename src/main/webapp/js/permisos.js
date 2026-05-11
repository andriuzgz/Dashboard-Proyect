// ===============================
// CARGAR PERMISOS (GET)
// ===============================
document.getElementById("opciones").addEventListener("change", function () {

    const rol = this.value;

    fetch(window.location.origin + "/Dashboard-Proyect/permisos?rol=" + rol)
        .then(res => res.json())
        .then(data => {

            console.log("PERMISOS:", data);

            data.forEach(p => {

                const fila = document.querySelector(`[data-modulo="${p.modulo}"]`);

                if (!fila) {
                    console.warn("No se encontró fila para:", p.modulo);
                    return;
                }

                // helper seguro
                const setChecked = (accion, valor) => {
                    const el = fila.querySelector(`[data-accion="${accion}"]`);
                    if (el) el.checked = valor;
                };

                setChecked("visible", p.visible);
                setChecked("crear", p.crear);
                setChecked("leer", p.leer);
                setChecked("editar", p.editar);
                setChecked("eliminar", p.eliminar);

                const nivel = fila.querySelector(".nivel");
                if (nivel) nivel.innerText = p.nivel;

            });

        })
        .catch(err => console.error("ERROR FETCH:", err));
});


// ===============================
// AUTO CARGA AL ENTRAR
// ===============================
window.addEventListener("DOMContentLoaded", () => {
    document.getElementById("opciones").dispatchEvent(new Event("change"));
});


// ===============================
// GUARDAR PERMISOS (POST)
// ===============================
document.querySelector(".guardar").addEventListener("click", () => {

    const rol = document.getElementById("opciones").value;
    const filas = document.querySelectorAll(".tr-table");

    let permisos = [];

    // helper seguro
    const getChecked = (fila, accion) => {
        const el = fila.querySelector(`[data-accion="${accion}"]`);
        return el ? el.checked : false;
    };

    filas.forEach(fila => {

        const modulo = fila.dataset.modulo;

        // ignorar filas especiales (ej: historico bloqueado)
        const visibleEl = fila.querySelector('[data-accion="visible"]');
        if (visibleEl && visibleEl.disabled) {
            console.log("Ignorando módulo protegido:", modulo);
            return;
        }

        const visible = getChecked(fila, "visible");
        const crear = getChecked(fila, "crear");
        const leer = getChecked(fila, "leer");
        const editar = getChecked(fila, "editar");
        const eliminar = getChecked(fila, "eliminar");

        permisos.push({
            modulo,
            visible,
            crear,
            leer,
            editar,
            eliminar
        });

    });

    console.log("ENVIANDO:", permisos);

    fetch(window.location.origin + "/Dashboard-Proyect/permisos", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            rol: rol,
            permisos: permisos
        })
    })
    .then(res => res.text())
    .then(data => {
        console.log("RESPUESTA:", data);
        alert("Guardado correctamente 🔥");
    })
    .catch(err => console.error("ERROR POST:", err));
});