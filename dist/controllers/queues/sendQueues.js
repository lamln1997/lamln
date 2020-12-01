"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.sendToQueue = void 0;
const setup_1 = require("../../setup");
const assertQueueOptions = {
    durable: true
};
const sendQueueOptions = {
    persistent: true
};
async function sendToQueue(nameQueue, messageQueue) {
    const channel = await setup_1.setupRabbit();
    channel.assertQueue(nameQueue, assertQueueOptions);
    channel.sendToQueue(nameQueue, Buffer.from(messageQueue), sendQueueOptions);
    console.log('========send queue success =======');
}
exports.sendToQueue = sendToQueue;
