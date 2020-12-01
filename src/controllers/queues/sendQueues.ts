import {setupRabbit} from '../../setup';
import {rabbitmqConfig} from "../../config/rabbitmq";
// đảm bảo rằng hàm đợi sẽ tồn tại sau khi khởi động lại rabbit
const assertQueueOptions = {
    durable: true
}

// đánh dấu tin nhắn của mình là liên tục

const sendQueueOptions = {
    persistent: true
}
async function sendToQueue(nameQueue, messageQueue: string) {
    const channel = await setupRabbit();
    channel.assertQueue(nameQueue, assertQueueOptions);
    channel.sendToQueue(nameQueue, Buffer.from(messageQueue), sendQueueOptions);
    console.log('========send queue success =======');
}

export {
    sendToQueue
}
