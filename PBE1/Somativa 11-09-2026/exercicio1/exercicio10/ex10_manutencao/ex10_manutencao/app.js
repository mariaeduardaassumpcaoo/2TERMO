const entrada = require('readline-sync')
const manutencao = require('./funcoesManutencao');

const nomeMaquina = entrada.question("Digite o nome da máquina: ");
const valorPecas = entrada.questionFloat("Informe o valor das peças: ")
const horasServicos = entrada.questionInt("Qual foi a quantidade de horas total do servico: ")
const verificarGarantia = entrada.questionInt("Qual foi a quantidade de meses desde a ultima manutencao?:")
const total = manutencao.calcularTotal(valorPecas, total)

console.log(`A maquina solicitada é ${nomeMaquina}, com a mao de obra de ${horasServicos}, o valor das pecas de ${valorPecas}, o total é de ${calcularTotal}, e a garantica em ${verificarGarantia}`)

// não consegui identificar meu erro.