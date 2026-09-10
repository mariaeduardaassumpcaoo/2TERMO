const entrada = require('readline-sync')

console.log("=== CATALOGO DE FILMES ===");  

const cinema = [
    {Titulo: "Barbie", Classificacao: 0},
    {Titulo: "Minha Culpa", Classificacao: 16},
    {Titulo: "50 tons de cinza", Classificacao: 18}

]

const idade = entrada.questionInt("Qual sua idade? ")

const filmes_a = []

for (let vezes = 0; vezes < cinema.length; vezes++) {
    if (idade >= cinema[vezes].Classificacao) {
        filmes_a.push(cinema[vezes].Titulo)
    }
}

console.log(`\nVoce pode assistir: ${filmes_a}`)