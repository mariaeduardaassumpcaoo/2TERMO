const entrada = require('readline-sync');

console.log("--ANALISE DE VOTAÇÃO---")

const nome = entrada.question("Nome do usuario: ");
const datadenascimento = entrada.questionInt("Digite seu ano de nascimento: ");

idade = 2026 - datadenascimento
if (idade >=16) {
    console.log(`\nVocê é a ${nome}, tem ${idade} anos e NÃO tem direito de voto !`)
} else if (idade <=16) {
    console.log(`\nVocê é a ${nome}, tem ${idade} anos e TEM o direito de voto!`)
}
