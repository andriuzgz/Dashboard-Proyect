function modalCrear() {

    const contenido =
        document.getElementById(
            "usuarios-form-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "crear";

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Creacion [C]";

    modal.querySelector(
        "#password-fields"
    ).style.display = "block";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Registrar";

    modal.querySelector(
        'input[name="password"]'
    ).required = true;

    modal.querySelector(
        'input[name="confirm_password"]'
    ).required = true;
}

function modalCrearDepartamento() {

    const contenido =
        document.getElementById(
            "departamentos-form-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "crear";

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Creacion [C]";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Registrar";
}

function modalCrearProveedor() {

    const contenido =
        document.getElementById(
            "proveedores-form-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "crear";

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Creacion [C]";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Registrar";
}

function modalCrearPedido() {

    const contenido =
        document.getElementById(
            "pedidos-form-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "crear";

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Creacion [C]";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Registrar";

    // =========================
    // CONTEXTO JD
    // =========================

    const rol =
        document.body.dataset.rol;

    if (rol == "3") {

        modal.querySelector(
            "#grupo-usuario"
        ).remove();

        const hidden =
            modal.querySelector(
                "#hidden-context"
            );

        hidden.innerHTML = `

			<input
				type="hidden"
				name="usuario"
				value="${document.body.dataset.usuario}">

			<input
				type="hidden"
				name="departamento"
				value="${document.body.dataset.departamento}">

		`;
    }
}

function modalCrearFactura() {

    const contenido =
        document.getElementById(
            "facturas-form-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );

    modal.querySelector(
        "#form-action"
    ).value = "crear";

    modal.querySelector(
        "#modal-title"
    ).innerHTML =
        "Operacion Creacion [C]";

    modal.querySelector(
        "#submit-button"
    ).innerHTML =
        "Añadir";
}