<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="model.Historico"%>

<%
@SuppressWarnings("unchecked")
List<Historico> historico  = (List<Historico>) request.getAttribute("historico");
%>

<!-- Include Modal -->
<jsp:include page="/jsp/components/modal.jsp" />

<title>Historico</title>
<div class="div-container historico">
	<div class="title">
		<a>Historico</a>
	</div>
	<p class="text">Muestra el historial registro de actividades de la
		aplicacion</p>
	<div class="grid-content-usuario">
		<div class="content">
			<div class="content-item">
				<a class="content-text">Filtrar Actividades</a>
			</div>
			<div class="content-about-table">
				<table class="table-add">
					<tr>
						<th class="th-table" colspan="2">Filtrar Movimientos</th>
					</tr>
					<tr class="tr-table">
						<td class="td-table">Filtra palabras claves para buscar</td>
						<td class="td-table"><input class="user-search" type=search></td>
					</tr>
				</table>
			</div>
		</div>
		<div class="content">
			<div class="content-item">
				<a class="content-text">Historial</a>
			</div>
			<div class="content-about-table">
				<table class="table">
					<tr>
						<th class="th-table">ID Historico</th>
						<th class="th-table">Usuario</th>
						<th class="th-table">Accion SQL</th>
						<th class="th-table">Tabla</th>
						<th class="th-table">Campo</th>
						<th class="th-table">Antes</th>
						<th class="th-table">Despues</th>
						<th class="th-table">Fecha y Hora</th>
						<th class="th-table">Accion</th>
					</tr>
					<%
					if (historico != null && !historico.isEmpty()) {
						for (Historico h : historico) {
					%>
					<tr class="tr-table">
						<td class="td-table"><%=h.getId()%></td>
						<td class="td-table"><%=h.getUsuario()%></td>
						<td class="td-table" <%=h.getClaseHistorico()%>><%=h.getAccion()%></td>
						<td class="td-table"><%=h.getTabla()%></td>
						<td class="td-table"><%=h.getCampo() != null ? h.getCampo() : "-"%></td>
						<td class="td-table"><%=h.getValorAnterior() != null ? h.getValorAnterior() : "-"%></td>
						<td class="td-table"><%=h.getValorNuevo() != null ? h.getValorNuevo() : "-"%></td>
						<td class="td-table"><%=h.getFecha()%></td>
						<td class="td-table">
							<button class="button-action" onclick="abrirModal()">🔍</button>
						</td>
					</tr>
					<%
					}
					} else {
					%>
					<tr>
						<td colspan="9" class="td-table" style="text-align: center;">
							No hay registros en el histórico</td>
					</tr>
					<%
					}
					%>
				</table>
			</div>
		</div>
	</div>
</div>
<script src="<%=request.getContextPath()%>/js/modal/modal.js"></script>