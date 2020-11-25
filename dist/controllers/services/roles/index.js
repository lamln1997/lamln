"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.updateRole = exports.getRoleById = exports.createRole = void 0;
const models_1 = require("../../../models");
const setup_1 = require("../../../setup");
async function createRole(body) {
    try {
        return setup_1.sequelizePsql.transaction(async (transaction) => {
            const role_permissions = [];
            body.permissions.map(per => {
                const obj = {
                    permission_id: parseInt(per),
                    RolePermission: {
                        constraints: false
                    }
                };
                role_permissions.push(obj);
            });
            const value = {
                name: body.name,
                description: body.description,
                roles_permissions: role_permissions
            };
            return models_1.RoleModel.create(value, { include: models_1.RolePermission, transaction });
        });
    }
    catch (e) {
        console.log(e);
        return null;
    }
}
exports.createRole = createRole;
async function getRoleById(id) {
    try {
        return await models_1.RoleModel.findOne({
            where: {
                id
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
                id
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
