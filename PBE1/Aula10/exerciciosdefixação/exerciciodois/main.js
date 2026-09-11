const entrada = require('readline-sync');
const geometria = require('./geometria');

const lado = 10;
const resultado = geometria.calcularAreaQuadrado(lado);

console.log(`Área total é: ${resultado.toFixed(1)}`);

