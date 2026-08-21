function calcularOrcamento(precoPeca, horasTrabalho) {
    const valorHora = 85.00;
    const totalMaoDeObra = horasTrabalho * valorHora
    return precoPeca + totalMaoDeObra;
}

function verificarGarantia(meses) {
    if (meses <= 3) { 
        return "Dentro de Garantia";
    }else {
        return "Garantia Expirada";
    }
}
function totalComDesconto (calcularOrcamento) {
    const desconto =calcularOrcamento * 0.05 
    const descontoTotal = calcularOrcamento - desconto
        return descontoTotal.toFixed(2)

}


module.exports = {
    calcularOrcamento,
    verificarGarantia,
    totalComDesconto
}