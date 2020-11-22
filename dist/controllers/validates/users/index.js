"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.validatorUpdate = exports.validatorLogin = exports.validatorRegisterUser = void 0;
const celebrate_1 = require("celebrate");
exports.validatorRegisterUser = celebrate_1.celebrate({
    [celebrate_1.Segments.BODY]: celebrate_1.Joi.object().keys({
        phone: celebrate_1.Joi.string().required().min(10).max(15),
        password: celebrate_1.Joi.string().required().min(6).max(255),
        email: celebrate_1.Joi.string().required(),
        first_name: celebrate_1.Joi.string().required(),
        last_name: celebrate_1.Joi.string().required(),
        age: celebrate_1.Joi.number(),
        address: celebrate_1.Joi.string().max(255).allow(null, ''),
    }),
});
exports.validatorLogin = celebrate_1.celebrate({
    [celebrate_1.Segments.BODY]: celebrate_1.Joi.object().keys({
        phone: celebrate_1.Joi.string().required(),
        password: celebrate_1.Joi.string().required()
    })
});
exports.validatorUpdate = celebrate_1.celebrate({
    [celebrate_1.Segments.BODY]: celebrate_1.Joi.object().keys({
        phone: celebrate_1.Joi.string().required().min(10).max(15),
        email: celebrate_1.Joi.string().required(),
        first_name: celebrate_1.Joi.string().required().max(255),
        last_name: celebrate_1.Joi.string().required().max(255),
        age: celebrate_1.Joi.number(),
        address: celebrate_1.Joi.string().max(255).allow(null, ''),
    })
});
module.exports = {
    validatorRegisterUser: exports.validatorRegisterUser,
    validatorLogin: exports.validatorLogin,
    validatorUpdate: exports.validatorUpdate
};
