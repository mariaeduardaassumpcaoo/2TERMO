const readline = require("readline-sync");
const venda = require("./calculosvenda");

let nome = readline.question("Digite o nome do cliente: ");
let preco = readline.questionFloat("Digite o preco: ");
let qtd = readline.questionInt("Digite a quantidade: ");

let total = venda.calcularTotal(preco, qtd);

let cupom = venda.gerarCupom(nome, total);

console.log(cupom);