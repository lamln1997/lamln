import {RoleModel} from '../../../models';

async function createRole(body) {
    try {
        return await RoleModel.create(body);
    } catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}
async function getRoleById(id) {
    try {
        return await RoleModel.findOne({
            where: {
                id: id
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
                id: id
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