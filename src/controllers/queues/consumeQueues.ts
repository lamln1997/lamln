import {setupRabbit} from '../../setup';
import {rabbitmqConfig} from "../../config/rabbitmq";

// đảm bảo rằng hàm đợi sẽ tồn tại sau khi khởi động lại rabbit
const assertQueueOptions = {
    durable: true
}

const consumeQueueOptions = {
    noAck: false
}

async function consumeQueue() {
    const channel = await setupRabbit();
    channel.assertQueue(rabbitmqConfig.nameQueue, assertQueueOptions);
    const message = new Promise(resolve => {
        channel.consume(rabbitmqConfig.nameQueue, (msgAck => {
            resolve(msgAck.content.toString())
        }), consumeQueueOptions);
    })
    message.then(content => console.log(content));
}

export {
    consumeQueue
}