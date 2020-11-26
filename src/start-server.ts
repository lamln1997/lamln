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
    return amqp.connect('amqp://localhost', (error, connection) => {
        if (error) {
            console.log(`==========connect rabbit fail with message: ${error}===========`);
        }
        if (connection) {
            console.log(`======connect rabbit thanh cong =========`);
            connection.createChannel((errCreateChannel, channel) => {
                if (errCreateChannel) {
                    console.log('===========fail create channel =========');
                }
                if (channel) {
                    const queue = 'Queue đầu tiên lâm tạo';
                    const msg = 'Đồng bộ user lên elasticsearch';
                    channel.assertQueue(queue, {
                        durable: false
                    });
                    channel.sendToQueue(queue, Buffer.from(msg));
                }
            })
        }
    });
}
module.exports = {
    start
}
