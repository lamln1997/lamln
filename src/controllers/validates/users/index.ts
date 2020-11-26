import {celebrate, Joi,Segments} from "celebrate";

export const validatorRegisterUser = celebrate({
    [Segments.BODY]: Joi.object().keys({
        phone: Joi.string().required().min(10).max(15),
        password: Joi.string().required().min(6).max(255),
        email: Joi.string().required(),
        first_name: Joi.string().required(),
        last_name: Joi.string().required(),
        age: Joi.number(),
        address: Joi.string().max(255).allow(null, ''),
        roles: Joi.array().required()
    }),
})

export const validatorLogin = celebrate({
    [Segments.BODY]: Joi.object().keys({
        phone: Joi.string().required(),
        password: Joi.string().required()
    })
})

export const validatorUpdate = celebrate({
    [Segments.BODY]: Joi.object().keys({
        phone: Joi.string().required().min(10).max(15),
        email: Joi.string().required(),
        first_name: Joi.string().required().max(255),
        last_name: Joi.string().required().max(255),
        age: Joi.number(),
        address: Joi.string().max(255).allow(null, ''),
        roles: Joi.array().required()
    })
})

module.exports = {
    validatorRegisterUser,
    validatorLogin,
    validatorUpdate
}
