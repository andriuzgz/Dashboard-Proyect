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

function modalVerProveedor(btn) {

    const contenido =
        document.getElementById(
            "proveedores-view-template"
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
        "#view-cif"
    ).innerHTML =
        btn.dataset.cif;

    modal.querySelector(
        "#view-telefono"
    ).innerHTML =
        btn.dataset.telefono;

    modal.querySelector(
        "#view-email"
    ).innerHTML =
        btn.dataset.email;

    modal.querySelector(
        "#view-fechaalta"
    ).innerHTML =
        btn.dataset.fechaalta;

    modal.querySelector(
        "#view-fechabaja"
    ).innerHTML =
        btn.dataset.fechabaja;

    modal.querySelector(
        "#view-departamentos"
    ).innerHTML =
        btn.dataset.departamentos;

    modal.querySelector(
        "#view-estado"
    ).innerHTML =
        btn.dataset.estado;
}

function modalVerPedido(btn) {

    const contenido =
        document.getElementById(
            "pedidos-view-template"
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
        "#view-usuario"
    ).innerHTML =
        btn.dataset.usuarioNombre;

    modal.querySelector(
        "#view-departamento"
    ).innerHTML =
        btn.dataset.departamentoNombre;

    modal.querySelector(
        "#view-proveedor"
    ).innerHTML =
        btn.dataset.proveedorNombre;

    modal.querySelector(
        "#view-numero"
    ).innerHTML =
        btn.dataset.numero;

    modal.querySelector(
        "#view-anio"
    ).innerHTML =
        btn.dataset.anio;

    modal.querySelector(
        "#view-fecha"
    ).innerHTML =
        btn.dataset.fecha;

    modal.querySelector(
        "#view-inversion"
    ).innerHTML =
        btn.dataset.inversion;

    modal.querySelector(
        "#view-cantidad"
    ).innerHTML =
        btn.dataset.cantidad;

    modal.querySelector(
        "#view-estado"
    ).innerHTML =
        btn.dataset.estado;

    modal.querySelector(
        "#view-factura"
    ).innerHTML =
        btn.dataset.factura;
}

function modalVerFactura(btn) {

    const contenido =
        document.getElementById(
            "facturas-view-template"
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
        "#view-numero"
    ).innerHTML =
        btn.dataset.numero;

    modal.querySelector(
        "#view-fecha"
    ).innerHTML =
        btn.dataset.fecha;

    modal.querySelector(
        "#view-vencimiento"
    ).innerHTML =
        btn.dataset.vencimiento;

    modal.querySelector(
        "#view-pedidos"
    ).innerHTML =
        btn.dataset.pedidos;

    modal.querySelector(
        "#view-importe"
    ).innerHTML =
        btn.dataset.importe;

    modal.querySelector(
        "#view-estado"
    ).innerHTML =
        btn.dataset.estado;

    modal.querySelector(
        "#view-restante"
    ).innerHTML =
        btn.dataset.restante + " dias";
}

function modalVerPresupuesto(btn) {

    const contenido =
        document.getElementById(
            "presupuestos-view-template"
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
        "#view-departamento"
    ).innerHTML =
        btn.dataset.departamento;

    modal.querySelector(
        "#view-anio"
    ).innerHTML =
        btn.dataset.anio;

    modal.querySelector(
        "#view-importe"
    ).innerHTML =
        btn.dataset.importe;

    modal.querySelector(
        "#view-gastado"
    ).innerHTML =
        btn.dataset.gastado;

    modal.querySelector(
        "#view-restante"
    ).innerHTML =
        btn.dataset.restante;

    modal.querySelector(
        "#view-estado"
    ).innerHTML =
        btn.dataset.estado;
}

function modalVerHistorico(btn) {

    const contenido =
        document.getElementById(
            "usuarios-view-template"
        ).innerHTML;

    cargarModal(contenido);

    const modal =
        document.getElementById(
            "modal-body"
        );
}