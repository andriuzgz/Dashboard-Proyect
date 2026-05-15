// Abrir Modal con Parametos [ELIMINAR]
function modalEliminar(id, nombre) {

    let contenido =
        document.getElementById(
            "modal-delete-content"
        ).innerHTML;

    cargarModal(contenido);

    document.getElementById("delete-message")
        .innerHTML =
        `¿Desea eliminar a
         <b>${nombre}</b>
         con el ID
         <b>${id}</b>?`;

    document.getElementById("delete-id")
        .value = id;

    document.getElementById("delete-form")
        .action = "cud/usuarios";

    document.getElementById("checkEliminar")
        .checked = false;

    document.getElementById("btnEliminar")
        .disabled = true;

    document.getElementById("checkEliminar")
        .addEventListener("change", function() {

            document.getElementById("btnEliminar")
                .disabled = !this.checked;

        });
}