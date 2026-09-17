const entrada = require('readline-sync');

console.log(`--CLASSIFICAÇÃO DE ATLETAS---`)

const idade = entrada.questionInt("Digite a idade do atleta: ");

if (idade >= 5 && idade <= 10) {
    console.log(" Categoria Infantil ");
} else if (idade >= 11 && idade <= 17) {
    console.log(" Categoria Juvenil ");
} else if (idade >= 18 && idade <= 60) {
    console.log(" Categoria Adulto ");
} else {
    console.log("Sênior");
}