function verificarPeso(leitura) {
    const pesos = Number(leitura);

    if (isNaN(pesos)) {
        throw new Error("Entrada invalida! Digite apenas números.");
    }

    if (pesos < 100 || pesos > 500) {
        throw new Error("Entrada invalida! Peso fora do padrão(100-500), peça descartada.");
    }

    return (`Peça aprovada com ${pesos}`);
}

module.exports = {
    verificarPeso
}
