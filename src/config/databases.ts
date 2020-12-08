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
}
export {
    databasePsql
}
