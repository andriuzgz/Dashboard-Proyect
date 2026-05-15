// Logout
function abrirModalLogout() {
    document.getElementById("modalLogout").classList.add("active");
}

function cerrarModalLogout() {
    document.getElementById("modalLogout").classList.remove("active");
}

function confirmarLogout() {
    document.getElementById("formLogout").submit();
}