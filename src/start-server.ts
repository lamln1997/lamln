import app from "./app";
import {
    addModelToDatabase,
    sequelizePsql
} from './setup'
// tslint:disable-next-line:no-var-requires
const amqp = require('amqplib/callback_api');

async function startServer() {
    return app.listen(app.get("port"), () => {
        console.log(`=========== App is running at port ${app.get('port')} ==========`);
    })
}
export  async function start() {
    // =========== comment lại chạy nhiều hoa hết cả mắt ============== //
    // await migrateDatabases();
    // sequelizePsql.sync({ alter: true }).then(() => {
    //     console.log('create model postgres success');
    // }).catch(err => {
    //     console.log(`postgres fail with message: ${err}` )
    // })
    return Promise.all([startServer(), connectRabbitMq()])
}
async function  migrateDatabases() {
    return addModelToDatabase();
}
async function connectRabbitMq() {
    return amqp.connect('amqp://localhost', (error, connect) => {
        if (error) {
            console.log(`==========connect rabbit fail with message: ${error}===========`);
        }
        if (connect) {
            console.log(`======connect rabbit thanh cong =========`);
        }
    });
}
module.exports = {
    start
}
