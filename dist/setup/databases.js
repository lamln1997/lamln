"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.addModelToDatabase = exports.sequelizePsql = void 0;
const { databasePsql } = require('../config/databases');
const sequelize_typescript_1 = require("sequelize-typescript");
const models_1 = require("../models");
exports.sequelizePsql = new sequelize_typescript_1.Sequelize({
    ...databasePsql
});
const modelsPsql = [
    models_1.UserModel,
    models_1.RoleModel,
    models_1.PermissionModel,
    models_1.RolePermission,
    models_1.UserRoleModel
];
exports.addModelToDatabase = () => {
    exports.sequelizePsql.addModels(modelsPsql);
};
module.exports = {
    addModelToDatabase: exports.addModelToDatabase,
    sequelizePsql: exports.sequelizePsql
};
