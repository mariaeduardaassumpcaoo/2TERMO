const fs = require('fs');

const sensores = [
    {codigo: 1001, tipo: "temperatura", leituraAtual: 55.6, status:"operando"},
    {codigo: 1002, tipo: "pressao", leituraAtual: 6, status:"operando"},
    {codigo: 1003, tipo: "temperatura", leituraAtual: 255.9, status:"Alerta"},
]
fs.writeFileSync('sensores.json', JSON.stringify(sensores, null, 2));
console.log(`\ Gravacao concluida com sucesso, verifique o arquivo gravado na pasta.`)