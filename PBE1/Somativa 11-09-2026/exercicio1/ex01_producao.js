const entrada = require('readline-sync')

const quantidade = entrada.question("Qual foi a quantidade de peças criadas por hora?: ");

const horas = entrada.questionInt("Qual foi a quantidade total de horas do turno?: ");

const total = quantidade * horas

console.log(`A produção por hora foi de ${quantidade}, o total de ${horas} horas, e foi produzido ${total} de peças.`)


