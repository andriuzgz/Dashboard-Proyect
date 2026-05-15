<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="modal-delete-content" style="display: none;">
	<div class="modal-bar">Operacion Eliminar [D]</div>
	<div class="content-about-item">
		<p id="delete-message"></p>

		<p class="rojo">Precaución: Esta operación no es reversible.</p>
		
		<label> 
		<input type="checkbox" id="checkEliminar">
			Estoy consciente de la operación
		</label>

		<form id="delete-form" method="post">
			<input type="hidden" name="action" value="eliminar"> <input
				type="hidden" name="id" id="delete-id">
			<div class="modal-actions">
				<button type="button" class="button" onclick="cerrarModal()">No</button>
				<button type="submit" class="button confirm" id="btnEliminar"
					disabled>Sí, Eliminar</button>
			</div>
		</form>
		
	</div>
</div>