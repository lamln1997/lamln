import {
    rabbitmqConfig
} from '../config/rabbitmq'
import * as amqp from  'amqplib/callback_api';

const msg = `Tin nhắn lâm tạo bằng tay`
// đảm bảo rằng hàm đợi sẽ tồn tại sau khi khởi động lại rabbit
const assertQueueOptions = {
    durable: true
}

// đánh dấu tin nhắn của mình là liên tục

const sendQueueOptions = {
    persistent: true
}


const consumeQueueOptions = {
    noAck: false
}
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

async function SendToQueue(channel) {
    // toi da 1 worker chi nhan 1 queue
    channel.assertQueue(rabbitmqConfig.nameQueue, assertQueueOptions);
    channel.sendToQueue(rabbitmqConfig.nameQueue, Buffer.from(msg), sendQueueOptions);
}

async function startRabbit() {
    const connection = await connectRabbit();
    const channel = await createChannel(connection)
    SendToQueue(channel).then(() => {console.log('send queue thanh cong')});
    console.log('============connect rabbit mq =============');
}

async function consumeQueue() {
    const connection = await connectRabbit();
    const channel = await createChannel(connection);
    channel.assertQueue(rabbitmqConfig.nameQueue, assertQueueOptions);
    const message = new Promise(resolve => {
        channel.consume(rabbitmqConfig.nameQueue, (msgAck => {
            resolve(msgAck.content.toString())
        }), consumeQueueOptions);
    })
    message.then(content => console.log(content));
}

export {
    startRabbit,
    consumeQueue
}
