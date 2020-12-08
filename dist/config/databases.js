"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.databasePsql = void 0;
const databasePsql = {
    database: 'express',
    dialect: 'postgres',
    port: 5432,
    replication: {
        read: {
            host: process.env.POSTGRES_HOST,
            username: 'root',
            password: '12345678'
        },
        write: {
            host: process.env.POSTGRES_HOST,
            username: 'root',
            password: '12345678'
        }
    }
};
exports.databasePsql = databasePsql;
