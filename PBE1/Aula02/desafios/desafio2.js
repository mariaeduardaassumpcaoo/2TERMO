const entrada = require('readline-sync');

const valordaconta = entrada.questionFloat("Digite o valor da conta: ");

if (valordaconta >= 100) {
    valortotal = valordaconta * 0.9
    console.log(`\n Você recebeu desconto: ${valortotal} `)
} else {
    console.log(`Você não recebeu nenhum desconto: `)
}
