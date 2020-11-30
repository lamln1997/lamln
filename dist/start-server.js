"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.start = void 0;
const app_1 = __importDefault(require("./app"));
const setup_1 = require("./setup");
const queues_1 = require("./controllers/queues");
const amqp = require('amqplib/callback_api');
async function startServer() {
    return app_1.default.listen(app_1.default.get("port"), () => {
        console.log(`=========== App is running at port ${app_1.default.get('port')} ==========`);
    });
}
async function start() {
    return Promise.all([startServer(), queues_1.sendToQueue()]);
}
exports.start = start;
async function migrateDatabases() {
    return setup_1.addModelToDatabase();
}
module.exports = {
    start
};
