export const databasePsql = {
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
}
module.exports = {
    databasePsql: databasePsql
}