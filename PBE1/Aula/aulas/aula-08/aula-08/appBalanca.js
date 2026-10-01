const readlineSync = require('readline-sync');
const verificarPeso = require('./funcoesBalanca');

while (true) {
    try {
        const leitura = readlineSync.question('Digite o peso (ou "sair" para encerrar): ');

        if (leitura.toLowerCase() === 'sair') {
            console.log('Sistema encerrado.');
            break;
        }
        const peso = Number(leitura);

        if (isNaN(peso)) {
            throw new Error("Voce digitou letras. Digite apenas numeros!");
        }

        const resultado = verificarPeso(peso) 

        console.log(resultado);

    } catch (erro) {
        console.log(`⚠️ ALERTA: ${erro.message}`);
    }
}
