const entrada = require('readline-sync')

const idade = entrada.questionInt("Digite sua idade")
const autorizacao = entrada.question("Você possui autorizacao?")
const acompanhado = entrada.question("Você esta acompanhado de um professor?")

if (idade >=16 && autorizacao == true || acompanhado == true ) {  
    console.log("Parabens, acesso liberado!")
} else {
    console.log("Sinto muito, acesso negado!")
}