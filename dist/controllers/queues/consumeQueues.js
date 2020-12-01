"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.consumeQueue = void 0;
const setup_1 = require("../../setup");
const services_1 = require("../services");
const assertQueueOptions = {
    durable: true
};
const consumeQueueOptions = {
    noAck: false
};
async function consumeQueue(nameQueue) {
    const channel = await setup_1.setupRabbit();
    channel.assertQueue(nameQueue, assertQueueOptions);
    const message = new Promise(resolve => {
        channel.consume(nameQueue, (msgAck => {
            resolve(msgAck.content.toString());
        }), consumeQueueOptions);
    });
    message.then(content => {
        console.log(`===========Content of queue "${nameQueue}": ${content}====`);
        services_1.insertDataToElasticSearch();
    });
}
exports.consumeQueue = consumeQueue;
