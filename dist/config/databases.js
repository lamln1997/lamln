"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.databasePsql = void 0;
const databasePsql = {
    database: 'express',
    dialect: 'postgres',
    port: 5432,
    replication: {
        read: {
            host: 'localhost',
            username: 'root',
            password: '12345678'
        },
        write: {
            host: 'localhost',
            username: 'root',
            password: '12345678'
        }
    }
};
exports.databasePsql = databasePsql;
