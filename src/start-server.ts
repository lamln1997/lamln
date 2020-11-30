import app from "./app";
import {
    addModelToDatabase,
    sequelizePsql,
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
    return Promise.all([startServer()])
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
                    const queuePusblish= 'Queue thứ 1 ngày 30/11';
                    const msg = 'Buồn làm chi em ơi';
                    channel.assertQueue(queuePusblish, {
                        durable: false
                    });
                    // gui queue
                    channel.sendToQueue(queuePusblish, Buffer.from(msg));
                    const queueSubscribe = 'Queue thứ 2';
                    // lang nghe queue
                    channel.consume(queueSubscribe, (message) => {
                        console.log(message.content.toString())
                    })
                }
            })
        }
    });
}
module.exports = {
    start
}
