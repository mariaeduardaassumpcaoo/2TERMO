const readline = require("readline-sync");

let pecasDefeituosas = [];

let quantidade = readline.questionInt("Quantas pecas com defeito foram encontradas? ");

for (let i = 0; i < quantidade; i++) {
    let numeroSerie = readline.questionInt("Digite o numero de serie: ");
    pecasDefeituosas.push(numeroSerie);
}

console.log("Total de pecas: " + pecasDefeituosas.length);
console.log("Numeros de serie: " + pecasDefeituosas);