const entrada = require('readline-sync');

console.log("=== GERADOR DE PARCELAS ===");

function gerarParcelas(valorTotal, quantidadeDeParcelas) {
    let valorDaParcela = valorTotal / quantidadeDeParcelas;
    return valorDaParcela;
}

const valorTotal = entrada.questionFloat("Digite o valor total da compra: ");
const quantidadeDeParcelas = entrada.questionInt("Digite a quantidade de parcelas(max12): ");

const valorDaParcela = gerarParcelas(valorTotal, quantidadeDeParcelas);
console.log(`O valor de cada parcela é: R$ ${valorDaParcela.toFixed(2)}`);