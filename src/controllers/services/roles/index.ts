import {RoleModel, RolePermission, PermissionModel} from '../../../models';
import {
    sequelizePsql
} from '../../../setup';
async function createRole(body) {
    try {
        return sequelizePsql.transaction( async transaction => {
            const role_permissions = [];
            body.permissions.map(per => {
                const obj = {
                    permission_id: parseInt(per),
                    RolePermission: {
                        constraints: false
                    }
                }
                role_permissions.push(obj);
            })
            const value = {
                name: body.name,
                description: body.description,
                roles_permissions: role_permissions
            }
            // @ts-ignore
            return RoleModel.create(value, {include: RolePermission, transaction});
        })
    } catch (e) {
        console.log(e);
        return null;
    }
}
async function getRoleById(id) {
    try {
        return await RoleModel.findOne({
            where: {
                id
            }
        });
    } catch (e) {
        console.log(`get role by id fail with message: ${e.message}`);
        return null;
    }
}

async function updateRole(id, body) {
    try {
        return await RoleModel.update(body, {
            where: {
                id
            },
            returning: true
        });
    } catch (e) {
        console.log(`update role fail with message: ${e.message}`);
        return null;
    }
}
export {
    createRole,
    getRoleById,
    updateRole
}
