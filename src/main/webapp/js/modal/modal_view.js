function modalVerUsuario(btn) {

	const contenido =
		document.getElementById(
			"usuarios-view-template"
		).innerHTML;

	cargarModal(contenido);

	const modal =
		document.getElementById(
			"modal-body"
		);

	modal.querySelector(
		"#view-id"
	).innerHTML =
		btn.dataset.id;

	modal.querySelector(
		"#view-nombre"
	).innerHTML =
		btn.dataset.nombre;

	modal.querySelector(
		"#view-apellidos"
	).innerHTML =
		btn.dataset.apellidos;

	modal.querySelector(
		"#view-fecha-nacimiento"
	).innerHTML =
		btn.dataset.fechaNacimiento;

	modal.querySelector(
		"#view-rol"
	).innerHTML =
		btn.dataset.rol;

	modal.querySelector(
		"#view-departamento"
	).innerHTML =
		btn.dataset.departamento;

	modal.querySelector(
		"#view-fecha-alta"
	).innerHTML =
		btn.dataset.fechaAlta;

	modal.querySelector(
		"#view-fecha-baja"
	).innerHTML =
		btn.dataset.fechaBaja;

	modal.querySelector(
		"#view-estado"
	).innerHTML =
		btn.dataset.estado;
}

function modalVerDepartamento(btn) {

	const contenido =
		document.getElementById(
			"departamentos-view-template"
		).innerHTML;

	cargarModal(contenido);

	const modal =
		document.getElementById(
			"modal-body"
		);

	modal.querySelector(
		"#view-id"
	).innerHTML =
		btn.dataset.id;

	modal.querySelector(
		"#view-nombre"
	).innerHTML =
		btn.dataset.nombre;

	modal.querySelector(
		"#view-codigo"
	).innerHTML =
		btn.dataset.codigo;

	modal.querySelector(
		"#view-responsable"
	).innerHTML =
		btn.dataset.responsable;

	modal.querySelector(
		"#view-presupuesto"
	).innerHTML =
		btn.dataset.presupuesto;

	modal.querySelector(
		"#view-proveedores"
	).innerHTML =
		btn.dataset.proveedores;

	modal.querySelector(
		"#view-anio"
	).innerHTML =
		btn.dataset.anio;
}