const entrada = require('readline-sync');

const material = entrada.question("Informe o nome do material comprado:");
const quantidade = entrada.questionInt("Informe a quantidade que deseja:");
const preco = entrada.questionFloat("Informe o preço do material:");

const TotalCompra = quantidade * preco

console.log(`O seu matérial comprado foi ${material}, em ${quantidade} quantidade com o valor total de ${TotalCompra}`)