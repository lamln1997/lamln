import {setupRabbit} from '../../setup';
import {rabbitmqConfig} from "../../config/rabbitmq";
import {insertDataToElasticSearch} from "../services";
// đảm bảo rằng hàm đợi sẽ tồn tại sau khi khởi động lại rabbit
const assertQueueOptions = {
    durable: true
}

const consumeQueueOptions = {
    noAck: false
}

async function consumeQueue(nameQueue) {
    const channel = await setupRabbit();
    channel.assertQueue(nameQueue, assertQueueOptions);
    const message = new Promise(resolve => {
        channel.consume(nameQueue, (msgAck => {
            resolve(msgAck.content.toString())
        }), consumeQueueOptions);
    })
    message.then(content => {
        console.log(`=========Content of queue "${nameQueue}": ${content}====`);
        insertDataToElasticSearch()
    });
}

export {
    consumeQueue
}
