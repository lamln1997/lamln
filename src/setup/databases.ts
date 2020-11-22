const {databasePsql} = require('../config/databases')
import {Sequelize} from 'sequelize-typescript'
import {
    UserModel,
    RoleModel,
    PermissionModel,
    RolePermission,
    UserRole
} from '../models'
export const sequelizePsql = new Sequelize({
    ...databasePsql
})
const modelsPsql = [
    UserModel,
    RoleModel,
    PermissionModel,
    RolePermission,
    UserRole
]
export const addModelToDatabase = () => {
    sequelizePsql.addModels(modelsPsql)
}

module.exports = {
    addModelToDatabase,
    sequelizePsql
}
