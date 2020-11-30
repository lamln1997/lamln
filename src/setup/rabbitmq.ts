import {
    rabbitmqConfig
} from '../config/rabbitmq'
import * as amqp from  'amqplib/callback_api';

async function connectRabbit() {
    return new Promise((resolve, reject) => {
        amqp.connect(rabbitmqConfig.url, (err, connection) => {
            if (err) {
                console.log(`======connect rabbit fail with error: ${err} ======`);
                reject(null);
            }
            resolve(connection);
        })
    });
}

async function createChannel(connection) {
    // @ts-ignore
    const channel = connection.createChannel();
    channel.prefetch(1);
    return channel;
}
async function setupRabbit() {
    const connection = await connectRabbit();
    const channel = await createChannel(connection)
    console.log('============connect rabbit mq =============');
    return channel;
}


export {
    setupRabbit
}
