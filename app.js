const cron = require('node-cron');

console.log("Inicio de la aplicación!!")

let times = 0;

cron.schedule('1-59/5 * * * * * *', () => {
    times++;
    console.log('Tick cada multiplo de 5: ',times);
});
