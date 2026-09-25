const entrada = require('readline-sync')

const temperatura = entrada.questionInt("Digite a temperatura da máquina: ");

if (temperatura < 60 ) {
    console.log(`Situacao NORMAL.`)
} else (temperatura > 61 || temperatura < 80) 
    console.log(`Situacao ATENCAO.`)
if (temperatura > 80 ) {
    console.log(`Situacao CRITICA.`)
}
