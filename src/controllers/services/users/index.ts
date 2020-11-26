import {UserModel, UserRole, RoleModel, PermissionModel} from '../../../models'
import { Op } from "sequelize";
import {sequelizePsql} from '../../../setup';

async function createUser(body) {
    try {
        return await sequelizePsql.transaction(async transaction => {
            // tslint:disable-next-line:variable-name
            const user_roles = []

            body.roles.map(item => {
                const obj = {
                    // tslint:disable-next-line:radix
                    role_id: parseInt(item),
                    UserRole: {
                        constraints: false
                    }
                }
                user_roles.push(obj);
            })
            const value = {
                phone: body.phone.trim(),
                email: body.email.trim(),
                password: body.password,
                first_name: body.first_name.trim(),
                last_name: body.last_name.trim(),
                age: body.age || null,
                address: body.address ? body.address.trim() : null,
                user_roles
            }
            // @ts-ignore
            return UserModel.create(value, {include: UserRole, transaction});
        })
    } catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}
async function checkUniqueData(phone, email) {
    try {
        return await UserModel.findOne({
            where: {
                [Op.or]: [{phone}, {email}]
            }
        });
    } catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}

async function checkExistPhone(id, phone) {
    try {
        return await UserModel.findOne({
            where: {
                phone,
                id: {
                    [Op.ne]: id
                }
            }
        })
    } catch (e) {
        console.log(`check exist phone fail: ${e}`);
        return null;
    }
}
async function checkExistEmail(id, email) {
    try {
        return await UserModel.findOne({
            where: {
                email,
                id: {
                    [Op.ne]: id
                }
            }
        })
    } catch (e) {
        console.log(`check exist email fail: ${e}`);
        return null;
    }
}
async function getUserByPhone(phone) {
    try {
        return await UserModel.findOne({
            where: {
                phone
            }
        })
    } catch (e) {
        console.log(`get user by phone fail with message: ${e.message}`);
        return null;
    }
}

async function getUserById(id, permission?: string) {
    try {
        // @ts-ignore
        return await UserModel.findOne({
            where: {
                id
            },
            // @ts-ignore
            include: [
                {
                    model: RoleModel,
                    through: {attributes: []},
                    include: [
                        {
                            model: PermissionModel,
                            where: {
                                name: `${permission}`
                            }
                        }
                    ]
                }
            ]
        })
    } catch (e) {
        console.log(`get user by id fail with message: ${e.message}`);
        return null;
    }
}

async function updateUserById(id, body) {
    try {
        return await UserModel.update(body,{
            where: {
                id
            },
            returning: true
        })
    } catch (e) {
        console.log(`update id fail: ${e}`);
        return null;
    }
}

async function deleteUserById(id) {
    try {
        return await UserModel.destroy({
            where: {
                id
            }
        })
    } catch (e) {
        console.log(`delete fail: ${e}`);
        return null;
    }
}
export {
    createUser,
    checkUniqueData,
    getUserByPhone,
    getUserById,
    updateUserById,
    checkExistPhone,
    checkExistEmail,
    deleteUserById
}

