"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sendToQueue = void 0;
const setup_1 = require("../../setup");
const rabbitmq_1 = require("../../config/rabbitmq");
const assertQueueOptions = {
    durable: true
};
const sendQueueOptions = {
    persistent: true
};
const messageQueue = 'Đồng bộ data từ postgres lên elasticsearch';
async function sendToQueue() {
    const channel = await setup_1.setupRabbit();
    channel.assertQueue(rabbitmq_1.rabbitmqConfig.nameQueue, assertQueueOptions);
    channel.sendToQueue(rabbitmq_1.rabbitmqConfig.nameQueue, Buffer.from(messageQueue), sendQueueOptions);
}
exports.sendToQueue = sendToQueue;
