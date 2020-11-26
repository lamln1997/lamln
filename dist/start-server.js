"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.start = void 0;
const app_1 = __importDefault(require("./app"));
const setup_1 = require("./setup");
const amqp = require('amqplib/callback_api');
async function startServer() {
    return app_1.default.listen(app_1.default.get("port"), () => {
        console.log(`=========== App is running at port ${app_1.default.get('port')} ==========`);
    });
}
async function start() {
    return Promise.all([startServer(), connectRabbitMq()]);
}
exports.start = start;
async function migrateDatabases() {
    return setup_1.addModelToDatabase();
}
async function connectRabbitMq() {
    return amqp.connect('amqp://localhost', (error, connection) => {
        if (error) {
            console.log(`==========connect rabbit fail with message: ${error}===========`);
        }
        if (connection) {
            console.log(`======connect rabbit thanh cong =========`);
            connection.createChannel((errCreateChannel, channel) => {
                if (errCreateChannel) {
                    console.log('===========fail create channel =========');
                }
                if (channel) {
                    const queue = 'Queue đầu tiên lâm tạo';
                    const msg = 'Đồng bộ user lên elasticsearch';
                    channel.assertQueue(queue, {
                        durable: false
                    });
                    channel.sendToQueue(queue, Buffer.from(msg));
                }
            });
        }
    });
}
module.exports = {
    start
};
