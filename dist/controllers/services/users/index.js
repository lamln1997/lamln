"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.deleteUserById = exports.updateUserById = exports.getUserById = exports.getUserByPhone = exports.checkExistEmail = exports.checkExistPhone = exports.checkUniqueData = exports.createUser = void 0;
const models_1 = require("../../../models");
const sequelize_1 = require("sequelize");
async function createUser(body) {
    console.log('service user');
    try {
        return await models_1.UserModel.create(body);
    }
    catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}
exports.createUser = createUser;
async function checkUniqueData(phone, email) {
    try {
        return await models_1.UserModel.findOne({
            where: {
                [sequelize_1.Op.or]: [{ phone: phone }, { email: email }]
            }
        });
    }
    catch (e) {
        console.log(`create fail with message: ${e.message}`);
        return null;
    }
}
exports.checkUniqueData = checkUniqueData;
async function checkExistPhone(id, phone) {
    try {
        return await models_1.UserModel.findOne({
            where: {
                phone: phone,
                id: {
                    [sequelize_1.Op.ne]: id
                }
            }
        });
    }
    catch (e) {
        console.log(`check exist phone fail: ${e}`);
        return null;
    }
}
exports.checkExistPhone = checkExistPhone;
async function checkExistEmail(id, email) {
    try {
        return await models_1.UserModel.findOne({
            where: {
                email: email,
                id: {
                    [sequelize_1.Op.ne]: id
                }
            }
        });
    }
    catch (e) {
        console.log(`check exist email fail: ${e}`);
        return null;
    }
}
exports.checkExistEmail = checkExistEmail;
async function getUserByPhone(phone) {
    try {
        return await models_1.UserModel.findOne({
            where: {
                phone
            }
        });
    }
    catch (e) {
        console.log(`get user by phone fail with message: ${e.message}`);
        return null;
    }
}
exports.getUserByPhone = getUserByPhone;
async function getUserById(id) {
    try {
        return await models_1.UserModel.findOne({
            where: {
                id: id
            }
        });
    }
    catch (e) {
        console.log(`get user by id fail with message: ${e.message}`);
        return null;
    }
}
exports.getUserById = getUserById;
async function updateUserById(id, body) {
    try {
        return await models_1.UserModel.update(body, {
            where: {
                id: id
            },
            returning: true
        });
    }
    catch (e) {
        console.log(`update id fail: ${e}`);
        return null;
    }
}
exports.updateUserById = updateUserById;
async function deleteUserById(id) {
    try {
        return await models_1.UserModel.destroy({
            where: {
                id: id
            }
        });
    }
    catch (e) {
        console.log(`delete fail: ${e}`);
        return null;
    }
}
exports.deleteUserById = deleteUserById;
module.exports = {
    createUser,
    checkUniqueData,
    getUserByPhone,
    getUserById,
    updateUserById,
    checkExistPhone,
    checkExistEmail,
    deleteUserById
};
