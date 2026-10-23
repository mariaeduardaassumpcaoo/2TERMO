const entrada = require('readline-sync')

const industria = require ('./calculoEnergia')

console.log("--- PAINEL DE INDUSTRIA ---")

const nome = entrada.question("Digite o nome da maquina: ");
const potencia = entrada.questionInt("Digite a potencia em Watts: ");
const hora = entrada.questionInt("Digite as horas de uso no mes: ");
const preco = entrada.questionFloat("Digite o preco do kWh: ");

const totalKwh = industria.calcularKwh(potencia, hora);
const totalCusto = industria.calcularCusto(totalKwh, preco);
const classificacao = industria.classificarConsumo(totalKwh);   

console.log("\n--- RELATORIO DE EFICIENCIA ---");
console.log(`Maquina: ${nome}`);
console.log(`Potencia: ${potencia} Watts`);
console.log(`Horas de uso: ${hora} horas`);
console.log(`Consumo total: ${totalKwh.toFixed(2)} kWh`);
console.log(`Custo total: R$ ${totalCusto.toFixed(2)}`);
console.log(`Classificacao: ${classificacao}`);
console.log(" 🫆 ".repeat(25));