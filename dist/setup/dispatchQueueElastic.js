"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.insertDataFromPostgresToElastic = void 0;
const sendQueues_1 = require("../controllers/queues/sendQueues");
async function insertDataFromPostgresToElastic() {
    await sendQueues_1.sendToQueue('insertDataElasticsearch', `Queue created at ${new Date()}`);
}
exports.insertDataFromPostgresToElastic = insertDataFromPostgresToElastic;
