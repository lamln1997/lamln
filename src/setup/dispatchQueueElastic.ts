import {
    sendToQueue
} from '../controllers/queues/sendQueues';
import {getAllUser} from '../controllers/services';
async function insertDataFromPostgresToElastic() {
    await sendToQueue('insertDataElasticsearch', `Queue created at ${new Date()}`);
}
export {
    insertDataFromPostgresToElastic
}
