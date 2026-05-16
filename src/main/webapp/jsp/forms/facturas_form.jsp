<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.util.List"%>
<%@ page import="model.Pedido"%>

<%
@SuppressWarnings("unchecked")
List<Pedido> pedidos = (List<Pedido>) request.getAttribute("pedidosSinFactura");
%>

<div id="facturas-form-template">

	<div class="modal-bar" id="modal-title"></div>

	<form class="grid-content-lista"
		action="<%=request.getContextPath()%>/cud/facturas" method="post">

		<input type="hidden" name="action" id="form-action"> <input
			type="hidden" name="id" id="edit-id">

		<div id="grupo-pedido">

			<label>Pedido Asociado:</label> <select class="select" name="pedido"
				required>

				<option value="">Seleccionar Pedido</option>

				<%
				if (pedidos != null) {

					for (Pedido p : pedidos) {
				%>

				<option value="<%=p.getId()%>">Pedido
					<%=p.getNumero()%>/<%=p.getAnio()%>

				</option>

				<%
				}
				}
				%>

			</select>

		</div>

		<label>Importe:</label> <input type="number" step="0.01"
			name="importe" id="edit-importe" class="user-search" required>

		<div class="modal-actions">

			<button type="button" class="button" onclick="cerrarModal()">

				Cancelar</button>

			<button type="submit" class="button confirm" id="submit-button">

			</button>

		</div>

	</form>

</div>