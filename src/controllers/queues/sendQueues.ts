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
const messageQueue = 'Đồng bộ data từ postgres lên elasticsearch';
async function sendToQueue() {
    const channel = await setupRabbit();
    channel.assertQueue(rabbitmqConfig.nameQueue, assertQueueOptions);
    channel.sendToQueue(rabbitmqConfig.nameQueue, Buffer.from(messageQueue), sendQueueOptions);
}

export {
    sendToQueue
}