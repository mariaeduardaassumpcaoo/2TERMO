const fs = require('fs');
const entrada = require('readline-sync');

console.log("=== VERIFICAÇÃO DE ID === ")

const funcionarios = [
    {id:111, nome:"João", setor:"Gerente"},
    {id:222, nome:"Maria", setor:"Vendedora"},
    {id:333, nome:"José", setor:"Estoquista"},
    {id:444, nome:"Ana", setor:"Atendente"},
    {id:555, nome:"Carlos", setor:"Segurança"}
]

const idBusca = parseInt(entrada.question("Digite o ID do funcionário para buscar: "));

const resultado = funcionarios.find(f => f.id === idBusca);
console.log(resultado);

if(resultado) {
    console.log("\n FUNCIONÁRIO ENCONTRADO");
    console.log(`ID: ${resultado.id}`);
    console.log(`Nome: ${resultado.nome}`);
    console.log(`Setor: ${resultado.setor}`);
} else {
    console.log("\n FUNCIONÁRIO NÃO ENCONTRADO");
}
