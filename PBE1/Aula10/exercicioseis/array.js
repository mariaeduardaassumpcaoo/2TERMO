const readline = require("readline-sync");

let listaVisitantes = [];

let resposta = "s";

while (resposta == "s") {

    let nome = readline.question("Digite o nome do visitante: ");
    let empresa = readline.question("Digite a empresa: ");

    let visitante = {
        nome: nome,
        empresa: empresa
    };

    listaVisitantes.push(visitante);

    resposta = readline.question("Deseja cadastrar um novo visitante? (s/n): ");
}

console.log(listaVisitantes);