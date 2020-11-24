import {RoleModel, RolePermission, PermissionModel} from '../../../models';

async function createRole(body) {
    try {
        return await RoleModel.create({
            name: body.name,
            description: body.description,
            roles_permissions: [{
                permission_id: body.permissions,
                RolePermission: {
                    constraints: false
                }
            }]
        }, {include: RolePermission});
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
