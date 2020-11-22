import {PermissionModel} from '../../../models';

async function createPermission(body) {
    try {
        return await PermissionModel.create(body);
    } catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}
async function getPermissionById(id) {
    try {
        return await PermissionModel.findOne({
            where: {
                id: id
            }
        })
    } catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}
async function update(body, id) {
    try {
        return await PermissionModel.update(body, {
            where: {
                id: id
            },
            returning: true
        })
    } catch (e) {
        console.log(`create fail with message: ${e}`);
        return null;
    }
}
export {
    createPermission,
    getPermissionById,
    update
}