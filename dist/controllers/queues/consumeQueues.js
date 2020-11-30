"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.consumeQueue = void 0;
const setup_1 = require("../../setup");
const rabbitmq_1 = require("../../config/rabbitmq");
const assertQueueOptions = {
    durable: true
};
const consumeQueueOptions = {
    noAck: false
};
async function consumeQueue() {
    const channel = await setup_1.setupRabbit();
    channel.assertQueue(rabbitmq_1.rabbitmqConfig.nameQueue, assertQueueOptions);
    const message = new Promise(resolve => {
        channel.consume(rabbitmq_1.rabbitmqConfig.nameQueue, (msgAck => {
            resolve(msgAck.content.toString());
        }), consumeQueueOptions);
    });
    message.then(content => console.log(content));
}
exports.consumeQueue = consumeQueue;
