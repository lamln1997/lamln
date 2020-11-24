"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.start = void 0;
const app_1 = __importDefault(require("./app"));
const setup_1 = require("./setup");
async function startServer() {
    return app_1.default.listen(app_1.default.get("port"), () => {
        console.log(`=========== App is running at port ${app_1.default.get('port')} ==========`);
    });
}
async function start() {
    await migrateDatabases();
    setup_1.sequelizePsql.sync({ alter: true }).then(() => {
        console.log('create model postgres success');
    }).catch(err => {
        console.log(`postgres fail with message: ${err}`);
    });
    return Promise.all([startServer()]);
}
exports.start = start;
async function migrateDatabases() {
    return setup_1.addModelToDatabase();
}
module.exports = {
    start
};
