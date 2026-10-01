const entrada = require('readline-sync');

console.log("===VERIFICADOR DE APOSENTADORIA===");

function verificarAposentadoria(idade, tempoDeContribuicao){
}

const nome = entrada.question("Qual seu nome?:");
const idade = entrada.questionInt("Qual sua idade?");
const tempoDeContribuicao = entrada.questionFloat("Qual seu tempo de contribuicao?: ")

if (idade >= 65 || tempoDeContribuicao >= 30) {

    console.log(`Parabens, você foi aposentado !`);
}
else  {
    console.log("Sinto muito, sua aposentadoria não deu certo");
}