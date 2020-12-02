import {
    sendToQueue
} from '../controllers/queues/sendQueues';
async function insertDataFromPostgresToElastic() {
    await sendToQueue('insertDataElasticsearch', `Queue created at ${new Date()}`);
}
export {
    insertDataFromPostgresToElastic
}
