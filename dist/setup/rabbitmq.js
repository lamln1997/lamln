"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.consumeQueue = exports.startRabbit = void 0;
const rabbitmq_1 = require("../config/rabbitmq");
const amqp = __importStar(require("amqplib/callback_api"));
const msg = `Tin nhắn lâm tạo bằng tay`;
const assertQueueOptions = {
    durable: true
};
const sendQueueOptions = {
    persistent: true
};
const consumeQueueOptions = {
    noAck: false
};
async function connectRabbit() {
    return new Promise((resolve, reject) => {
        amqp.connect(rabbitmq_1.rabbitmqConfig.url, (err, connection) => {
            if (err) {
                console.log(`======connect rabbit fail with error: ${err} ======`);
                reject(null);
            }
            resolve(connection);
        });
    });
}
async function createChannel(connection) {
    const channel = connection.createChannel();
    channel.prefetch(1);
    return channel;
}
async function SendToQueue(channel) {
    channel.assertQueue(rabbitmq_1.rabbitmqConfig.nameQueue, assertQueueOptions);
    channel.sendToQueue(rabbitmq_1.rabbitmqConfig.nameQueue, Buffer.from(msg), sendQueueOptions);
}
async function startRabbit() {
    const connection = await connectRabbit();
    const channel = await createChannel(connection);
    SendToQueue(channel).then(() => { console.log('send queue thanh cong'); });
    console.log('============connect rabbit mq =============');
}
exports.startRabbit = startRabbit;
async function consumeQueue() {
    const connection = await connectRabbit();
    const channel = await createChannel(connection);
    channel.assertQueue(rabbitmq_1.rabbitmqConfig.nameQueue, assertQueueOptions);
    const message = new Promise(resolve => {
        channel.consume(rabbitmq_1.rabbitmqConfig.nameQueue, (msgAck => {
            resolve(msgAck.content.toString());
        }), consumeQueueOptions);
    });
    message.then(content => console.log(content));
}
exports.consumeQueue = consumeQueue;
