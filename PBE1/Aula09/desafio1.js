const fs = require('fs');

const prudutos = [
    {id:1, nome:"Bala", qtd:100},
    {id:2, nome:"Chocolate", qtd:20},
    {id:3, nome:"Pirulito", qtd:50},
    {id:4, nome:"Chiclete", qtd:10},
    {id:5, nome:"Biscoito", qtd:200},
    {id:6, nome:"Refrigerante", qtd:30},
    {id:7, nome:"Suco", qtd:80},
];

function salvarDados() {
    const dadosTexto = JSON.stringify(prudutos, null, 2);

    fs.writeFileSync('estoque.json', dadosTexto);
    console.log("Dados salvos com sucesso no arquivo estoque.json!");
}

function EstoqueMenosDe100() {
    const produtosMenosDe100 = prudutos.filter(produto => produto.qtd < 100);
    console.log(produtosMenosDe100);
}

salvarDados();
EstoqueMenosDe100();