<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="facturas-view-template">


	<div class="modal-bar">Informacion Factura</div>

	<div class="content-about-item">

		<table class="table-perfil">

			<tr class="tr-perfil">

				<td class="td-perfil">ID Factura:</td>

				<td class="td-perfil" id="view-id"></td>

			</tr>

			<tr class="tr-perfil">

				<td class="td-perfil">Numero Factura:</td>

				<td class="td-perfil" id="view-numero"></td>

			</tr>

			<tr class="tr-perfil">

				<td class="td-perfil">Fecha Factura:</td>

				<td class="td-perfil" id="view-fecha"></td>

			</tr>

			<tr class="tr-perfil">

				<td class="td-perfil">Fecha Vencimiento:</td>

				<td class="td-perfil" id="view-vencimiento"></td>

			</tr>

			<tr class="tr-perfil">

				<td class="td-perfil">Pedido Asociado:</td>

				<td class="td-perfil" id="view-pedidos"></td>

			</tr>

			<tr class="tr-perfil">

				<td class="td-perfil">Importe:</td>

				<td class="td-perfil" id="view-importe"></td>

			</tr>

			<tr class="tr-perfil">

				<td class="td-perfil">Estado:</td>

				<td class="td-perfil" id="view-estado"></td>

			</tr>

			<tr class="tr-perfil">

				<td class="td-perfil">Tiempo Restante:</td>

				<td class="td-perfil" id="view-restante"></td>

			</tr>

		</table>
		<div class="modal-actions">

			<button type="button" class="button" onclick="cerrarModal()">

				Cerrar</button>

		</div>
	</div>

</div>