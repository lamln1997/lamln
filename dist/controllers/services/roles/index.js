"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.updateRole = exports.getRoleById = exports.createRole = void 0;
const models_1 = require("../../../models");
async function createRole(body) {
    try {
        return await models_1.RoleModel.create(body);
    }
    catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}
exports.createRole = createRole;
async function getRoleById(id) {
    try {
        return await models_1.RoleModel.findOne({
            where: {
                id: id
            }
        });
    }
    catch (e) {
        console.log(`get role by id fail with message: ${e.message}`);
        return null;
    }
}
exports.getRoleById = getRoleById;
async function updateRole(id, body) {
    try {
        return await models_1.RoleModel.update(body, {
            where: {
                id: id
            },
            returning: true
        });
    }
    catch (e) {
        console.log(`update role fail with message: ${e.message}`);
        return null;
    }
}
exports.updateRole = updateRole;
