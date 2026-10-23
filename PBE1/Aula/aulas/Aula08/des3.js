const entrada = require('readline-sync');

console.log("=== CALCULADORA DE AREA DE TERRENOS ===");

function calcularAreaTerreno(largura, comprimento) {
    return largura * comprimento;
}

const terreno1Largura = entrada.questionFloat("Digite a largura do terreno 1 (em metros): ");
const terreno1Comprimento = entrada.questionFloat("Digite o comprimento do terreno 1 (em metros): ");

const terreno2Largura = entrada.questionFloat("Digite a largura do terreno 2 (em metros): ");
const terreno2Comprimento = entrada.questionFloat("Digite o comprimento do terreno 2 (em metros): ");

const terreno3Largura = entrada.questionFloat("Digite a largura do terreno 2 (em metros): ");
const terreno3Comprimento = entrada.questionFloat("Digite o comprimento do terreno 2 (em metros): ");

const areaTerreno1 = calcularAreaTerreno(terreno1Largura, terreno1Comprimento);
const areaTerreno2 = calcularAreaTerreno(terreno2Largura, terreno2Comprimento);
const areaTerreno3 = calcularAreaTerreno(terreno3Largura, terreno3Comprimento);
   
console.log(`A área total do terreno 1 é ${areaTerreno1}`);
console.log(`A áreal total do Terreno 2 é ${areaTerreno2}`);
console.log(`A área total do Terreno 3 é ${areaTerreno2}`);