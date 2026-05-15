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