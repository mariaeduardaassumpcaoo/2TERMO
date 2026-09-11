function calcularMaoDeObra(horast){
    const horas = 80.00;
    return horas * horast
}

function calcularTotal(valorPecas, horas){
    return valorPecas + horas;
}

function verificarGarantia(meses){
    if (meses <= 6)
        console.log('FORA DA GARANTIA!!!')
}

module.exports = {
    calcularMaoDeObra,
    calcularTotal,
    verificarGarantia
};
    
