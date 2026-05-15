// Abrir Modales - Universal entre Modales

function abrirModal() {
    document.getElementById("modal").classList.add("active");
}

function cerrarModal() {
    document.getElementById("modal").classList.remove("active");
}

// Abrir Modales - Universal entre Modulos [VER]
function cargarModal(contenido) {

    document.getElementById("modal-body").innerHTML =
        contenido;

    abrirModal();
}