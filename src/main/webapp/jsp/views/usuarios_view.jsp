<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal-bar">Detalles del Usuario</div>

<div class="content-about-table">

	<table class="table-perfil">
		<tr class="tr-perfil">
			<td class="td-perfil">ID Usuario:</td>

			<td class="td-perfil" id="view-id"></td>
		</tr>
		<tr class="tr-perfil">
			<td class="td-perfil">Nombre:</td>

			<td class="td-perfil" id="view-nombre"></td>
		</tr>
		<tr class="tr-perfil">
			<td class="td-perfil">Apellidos:</td>

			<td class="td-perfil" id="view-apellidos"></td>
		</tr>
		<tr class="tr-perfil">
			<td class="td-perfil">Fecha Nacimiento:</td>

			<td class="td-perfil" id="view-fecha-nacimiento"></td>
		</tr>
		<tr class="tr-perfil">
			<td class="td-perfil">Rol:</td>

			<td class="td-perfil" id="view-rol"></td>
		</tr>
		<tr class="tr-perfil">
			<td class="td-perfil">Departamento:</td>

			<td class="td-perfil" id="view-departamento"></td>
		</tr>
		<tr class="tr-perfil">
			<td class="td-perfil">Fecha Alta:</td>

			<td class="td-perfil" id="view-fecha-alta"></td>
		</tr>
		<tr class="tr-perfil">
			<td class="td-perfil">Fecha Baja:</td>

			<td class="td-perfil" id="view-fecha-baja"></td>
		</tr>
		<tr class="tr-perfil">
			<td class="td-perfil estado-activo">Estado:</td>

			<td class="td-perfil" id="view-estado"></td>
		</tr>

	</table>
	<div class="modal-actions">
		<button type="button" class="button" onclick="cerrarModal()">Cerrar</button>
	</div>
</div>