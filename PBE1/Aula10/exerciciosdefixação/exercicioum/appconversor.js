const entrada = require('readline-sync');

const conversor = require('./conversor');

const dolar = entrada.questionFloat("Digite o seu valor em Dolar: ");
const resultado = conversor.retornarEmReal(dolar);

console.log(`Valor total em Real: R$ ${resultado.toFixed(2)}`)