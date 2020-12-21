import app from "./app";
import {
    addModelToDatabase,
    sequelizePsql,
    insertDataFromPostgresToElastic
} from './setup';
import {
    sendToQueue,
    consumeQueue
} from './controllers/queues';
// tslint:disable-next-line:no-var-requires

async function startServer() {
    return app.listen(app.get("port"), () => {
        console.log(`=========== App is running at port ${app.get('port')} ==========`);
    })
}
export  async function start() {
    // ========== comment lại chạy nhiều hoa hết cả mắt ============ //
    await migrateDatabases();
    sequelizePsql.sync({ alter: true }).then(() => {
        console.log('create model postgres success');
    }).catch(err => {
        console.log(`postgres fail with message: ${err}` )
    })
    return Promise.all([startServer(), insertDataFromPostgresToElastic(), consumeQueue('insertDataElasticsearch')])
}
async function  migrateDatabases() {
    return addModelToDatabase();
}
module.exports = {
    start
}
