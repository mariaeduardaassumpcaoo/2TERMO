const entrada = require ('readline-sync');

const gasolina = entrada.questionInt("Qual o preço da gasolina?")
const alcool = entrada.questionInt("Qual o preço do alccol? ")

const total = alcool / gasolina
if (total <=0.7) {
    console.log("Abasteça com alcool!")
} else {
    console.log("Abasteça com gasolina!")
}
