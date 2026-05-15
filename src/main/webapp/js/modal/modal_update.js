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