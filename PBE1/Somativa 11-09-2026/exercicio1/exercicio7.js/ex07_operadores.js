const entrada = require("readline-sync");

let listaNomes = [];
for (let i = 0; i < 5; i++) {
  let nome = entrada.question("Digite um nome: ");
  listaNomes.push(nome);
}

for (let i = 0; i < listaNomes.length; i++) {
  console.log(`O nome na posição ${i} é: ${listaNomes[i]}`);
}
    
