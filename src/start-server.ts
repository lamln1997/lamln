import app from "./app";
import {
    addModelToDatabase,
    sequelizePsql
} from './setup'
async function startServer() {
    return app.listen(app.get("port"), () => {
        console.log(`=========== App is running at port ${app.get('port')} ==========`);
    })
}
export  async function start() {
    await migrateDatabases();
    sequelizePsql.sync({ alter: true }).then(() => {
        console.log('create model postgres success');
    }).catch(err => {
        console.log(`postgres fail with message: ${err}` )
    })
    return Promise.all([startServer()])
}
async function  migrateDatabases() {
    return addModelToDatabase();
}
module.exports = {
    start
}