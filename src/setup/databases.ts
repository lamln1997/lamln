// tslint:disable-next-line:no-var-requires
const {databasePsql} = require('../config/databases')
import {Sequelize} from 'sequelize-typescript'
import {
    UserModel,
    RoleModel,
    PermissionModel,
    RolePermission,
    UserRoleModel
} from '../models'
export const sequelizePsql = new Sequelize({
    ...databasePsql
})
const modelsPsql = [
    UserModel,
    RoleModel,
    PermissionModel,
    RolePermission,
    UserRoleModel
]
export const addModelToDatabase = () => {
    sequelizePsql.addModels(modelsPsql)
}

module.exports = {
    addModelToDatabase,
    sequelizePsql
}
