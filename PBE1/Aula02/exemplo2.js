const entrada = require('readline-sync');
const num = entrada.questionInt("Tabuaba de qual numero? ");

for(let i = 1; i <=10; i++){
    console.log(`${num} x ${i} = ${num * i}`);
}
