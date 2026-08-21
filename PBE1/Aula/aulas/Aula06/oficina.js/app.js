const entrada = require('readline-sync')

// importar o módulo funcoesOficina
const oficina = require('./funcoesOficina');

console.log("=== SISTEMA DE GESTAO DE OFICINA ===") 

const peca = entrada.questionFloat("Preco da peca: R$ ");
const horas = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

const statusGarantia = oficina.verificarGarantia(tempoUso);
const total = oficina.calcularOrcamento(peca,horas);
const totaldesconto = oficina.totalComDesconto(total);

// Relatorio final
console.log("\n--- RELATORIO DE SERVICO ---");
console.log(`Orcamento: R$ ${total.toFixed(2)}`);
console.log(`Orcamento com Desconto (5%): R$ ${totaldesconto}`);
console.log(`Status de Garantia ${statusGarantia}`);
console.log(" 🚗 ".repeat(15));_-