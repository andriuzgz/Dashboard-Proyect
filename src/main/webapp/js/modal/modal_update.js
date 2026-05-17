function modalEditarUsuario(btn) {

    const contenido =
        document.getElementById(
            "usuarios-update-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "editar";

    modal.querySelector(
        "#edit-id"
    ).value =
        btn.dataset.id;

    modal.querySelector(
        "#edit-nombre"
    ).value =
        btn.dataset.nombre;

    modal.querySelector(
        "#edit-apellidos"
    ).value =
        btn.dataset.apellidos;

    modal.querySelector(
        "#edit-fecha"
    ).value =
        btn.dataset.fecha;

    modal.querySelector(
        "#edit-rol"
    ).value =
        btn.dataset.rol;

    modal.querySelector(
        "#edit-departamento"
    ).value =
        btn.dataset.departamento;

    modal.querySelector(
        "#edit-estado"
    ).value =
        btn.dataset.estado;

    modal.querySelector(
        "#password-fields"
    ).style.display =
        "none";

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Editar [U]";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Guardar Cambios";

    modal.querySelector(
        'input[name="password"]'
    ).required = false;

    modal.querySelector(
        'input[name="confirm_password"]'
    ).required = false;
}

function modalEditarDepartamento(btn) {

    const contenido =
        document.getElementById(
            "departamentos-update-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "editar";

    modal.querySelector(
        "#edit-id"
    ).value =
        btn.dataset.id;

    modal.querySelector(
        "#edit-nombre"
    ).value =
        btn.dataset.nombre;

    modal.querySelector(
        "#edit-codigo"
    ).value =
        btn.dataset.codigo;

    modal.querySelector(
        "#edit-responsable"
    ).value =
        btn.dataset.responsable;

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Editar [U]";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Guardar Cambios";
}

function modalEditarProveedor(btn) {

    const contenido =
        document.getElementById(
            "proveedores-update-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "editar";

    modal.querySelector(
        "#edit-id"
    ).value =
        btn.dataset.id;

    modal.querySelector(
        "#edit-nombre"
    ).value =
        btn.dataset.nombre;

    modal.querySelector(
        "#edit-cif"
    ).value =
        btn.dataset.cif;

    modal.querySelector(
        "#edit-telefono"
    ).value =
        btn.dataset.telefono;

    modal.querySelector(
        "#edit-email"
    ).value =
        btn.dataset.email;

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Editar [U]";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Guardar Cambios";
}

function modalEditarPedido(btn) {

    const contenido =
        document.getElementById(
            "pedidos-update-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "editar";

    modal.querySelector(
        "#edit-id"
    ).value =
        btn.dataset.id;

    modal.querySelector(
        "#edit-usuario"
    ).value =
        btn.dataset.usuario;

    modal.querySelector(
        "#edit-departamento"
    ).value =
        btn.dataset.departamento;

    modal.querySelector(
        "#edit-proveedor"
    ).value =
        btn.dataset.proveedor;

    modal.querySelector(
        "#edit-numero"
    ).value =
        btn.dataset.numero;

    modal.querySelector(
        "#edit-anio"
    ).value =
        btn.dataset.anio;

    modal.querySelector(
        "#edit-fecha"
    ).value =
        btn.dataset.fecha;

    modal.querySelector(
        "#edit-inversion"
    ).value =
        btn.dataset.inversion;

    modal.querySelector(
        "#edit-cantidad"
    ).value =
        btn.dataset.cantidad;

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Editar [U]";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Guardar Cambios";
}

function modalEditarFactura(btn) {

    const contenido =
        document.getElementById(
            "facturas-update-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "editar";

    modal.querySelector(
        "#edit-id"
    ).value =
        btn.dataset.id;

    modal.querySelector(
        "#edit-importe"
    ).value =
        btn.dataset.importe;

    modal.querySelector(
        "#grupo-pedido"
    ).remove();

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Editar [U]";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Guardar Cambios";
}

function modalEditarPresupuesto(btn) {

    const contenido =
        document.getElementById(
            "presupuestos-update-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "editar";

    modal.querySelector(
        "#edit-id"
    ).value =
        btn.dataset.id;

    modal.querySelector(
        "#edit-importe"
    ).value =
        btn.dataset.importe;

    modal.querySelector(
        "#grupo-departamento"
    ).remove();

    modal.querySelector(
        "#grupo-anio"
    ).remove();

    modal.querySelector(
        "#grupo-estado"
    ).remove();

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Editar [U]";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Guardar Cambios";
}