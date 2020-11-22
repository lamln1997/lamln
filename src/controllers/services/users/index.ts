import {UserModel} from '../../../models'
import { Op } from "sequelize";

export async function createUser(body) {
    console.log('service user');
    try {
        return await UserModel.create(body);
    } catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}
export async function checkUniqueData(phone, email) {
    try {
        return await UserModel.findOne({
            where: {
                [Op.or]: [{phone: phone}, {email: email}]
            }
        });
    } catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}

export async function checkExistPhone(id, phone) {
    try {
        return await UserModel.findOne({
            where: {
                phone: phone,
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
export async function checkExistEmail(id, email) {
    try {
        return await UserModel.findOne({
            where: {
                email: email,
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
export async function getUserByPhone(phone) {
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

export async function getUserById(id) {
    try {
        return await UserModel.findOne({
            where: {
                id: id
            }
        })
    } catch (e) {
        console.log(`get user by id fail with message: ${e.message}`);
        return null;
    }
}

export async function updateUserById(id, body) {
    try {
        return await UserModel.update(body,{
            where: {
                id: id
            },
            returning: true
        })
    } catch (e) {
        console.log(`update id fail: ${e}`);
        return null;
    }
}

export async function deleteUserById(id) {
    try {
        return await UserModel.destroy({
            where: {
                id: id
            }
        })
    } catch (e) {
        console.log(`delete fail: ${e}`);
        return null;
    }
}

module.exports = {
    createUser,
    checkUniqueData,
    getUserByPhone,
    getUserById,
    updateUserById,
    checkExistPhone,
    checkExistEmail,
    deleteUserById
}

