"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.update = exports.getPermissionById = exports.createPermission = void 0;
const models_1 = require("../../../models");
async function createPermission(body) {
    try {
        return await models_1.PermissionModel.create(body);
    }
    catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}
exports.createPermission = createPermission;
async function getPermissionById(id) {
    try {
        return await models_1.PermissionModel.findOne({
            where: {
                id: id
            }
        });
    }
    catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}
exports.getPermissionById = getPermissionById;
async function update(body, id) {
    try {
        return await models_1.PermissionModel.update(body, {
            where: {
                id: id
            },
            returning: true
        });
    }
    catch (e) {
        console.log(`create fail with message: ${e}`);
        return null;
    }
}
exports.update = update;
