const entrada = require('readline-sync');

console.log(`--SIMULADOR DE EMPRÉSTIMO---`);

const nome = entrada.question("Digite seu nome e se está limpo:") // true or false
const renda = entrada.questionFloat("Digite sua renda mensal: ");

if (renda >= 2000) {
    console.log(`\nParabéns ${nome}, Empréstimo aprovado!`) 
} else {
    console.log(`\nSinto muito ${nome}, Empréstimo negado!`)
}
