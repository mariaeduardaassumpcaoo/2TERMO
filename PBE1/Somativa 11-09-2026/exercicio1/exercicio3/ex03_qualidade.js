const entrada = require('readline-sync')

const pesos = entrada.questionFloat("Qual o peso da peca?:");

if (pesos < 95 || pesos > 105)  {
    console.log(`PEÇA REPROVADA! ESTÁ FORA DO PADRÃO.`)
} else {
    console.log(`PEÇA APROVADA! ESTÁ DENTRO DO PADRÃO.`)
}
