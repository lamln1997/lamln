"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.insertDataToElasticSearch = exports.getUsersService = exports.deleteUserById = exports.checkExistEmail = exports.checkExistPhone = exports.updateUserById = exports.getUserById = exports.getUserByPhone = exports.checkUniqueData = exports.createUser = void 0;
const models_1 = require("../../../models");
const sequelize_1 = require("sequelize");
const setup_1 = require("../../../setup");
const setup_2 = require("../../../setup");
async function createUser(body) {
    try {
        return await setup_1.sequelizePsql.transaction(async (transaction) => {
            const user_roles = [];
            body.roles.map(item => {
                const obj = {
                    role_id: parseInt(item),
                    UserRoleModel: {
                        constraints: false
                    }
                };
                user_roles.push(obj);
            });
            const value = {
                phone: body.phone.trim(),
                email: body.email.trim(),
                password: body.password,
                first_name: body.first_name.trim(),
                last_name: body.last_name.trim(),
                age: body.age || null,
                address: body.address ? body.address.trim() : null,
                user_roles
            };
            return models_1.UserModel.create(value, { include: models_1.UserRoleModel, transaction });
        });
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
                [sequelize_1.Op.or]: [{ phone }, { email }]
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
                phone,
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
                email,
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
async function getUserById(id, permission) {
    try {
        return await models_1.UserModel.findOne({
            where: {
                id
            },
            include: [
                {
                    model: models_1.RoleModel,
                    through: { attributes: [] },
                    include: [
                        {
                            model: models_1.PermissionModel,
                            where: {
                                name: `${permission}`
                            }
                        }
                    ]
                }
            ]
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
                id
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
                id
            }
        });
    }
    catch (e) {
        console.log(`delete fail: ${e}`);
        return null;
    }
}
exports.deleteUserById = deleteUserById;
async function getUsersService(offset, limit, query) {
    try {
        const where = [];
        if (query.first_name.trim()) {
            const obj = {
                match: {
                    first_name: query.first_name
                }
            };
            where.push(obj);
        }
        if (query.last_name.trim()) {
            const obj = {
                match: {
                    last_name: query.last_name
                }
            };
            where.push(obj);
        }
        if (query.phone.trim()) {
            const obj = {
                match: {
                    phone: query.phone
                }
            };
            where.push(obj);
        }
        if (query.email.trim()) {
            const obj = {
                match: {
                    email: query.email
                }
            };
            where.push(obj);
        }
        return await setup_2.searchClient.search({
            index: 'users',
            from: offset,
            size: limit,
            body: {
                query: {
                    bool: {
                        must: where
                    }
                }
            }
        });
    }
    catch (e) {
        console.log(`===get all user fail with error: ${e.message}`);
        return null;
    }
}
exports.getUsersService = getUsersService;
async function insertDataToElasticSearch() {
    setup_2.searchClient.indices.delete({
        index: 'users'
    }).then(res => {
        console.log(`===== delete index user SUCCESS ==========`);
        createIndexUsersInElasticsearch();
    }).catch(() => {
        console.log(`===== delete index user FAIL ==========`);
        createIndexUsersInElasticsearch();
    });
}
exports.insertDataToElasticSearch = insertDataToElasticSearch;
async function createIndexUsersInElasticsearch() {
    const users = await models_1.UserModel.findAll();
    for (const user of users) {
        setup_2.searchClient.index({
            index: 'users',
            body: user
        });
    }
}
