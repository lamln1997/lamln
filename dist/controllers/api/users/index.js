"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.userRouter = void 0;
const express = __importStar(require("express"));
const bcrypt = __importStar(require("bcrypt"));
const jwt = __importStar(require("jsonwebtoken"));
const index_1 = require("../../validates/users/index");
const response_1 = require("../../../response");
const middleware_1 = require("../../middleware");
const services_1 = require("../../services");
const userRouter = express.Router();
exports.userRouter = userRouter;
userRouter.post('/register', index_1.validatorRegisterUser, register);
userRouter.post('/login', index_1.validatorLogin, login);
userRouter.put('/update/:id', middleware_1.checkToken, index_1.validatorUpdate, update);
userRouter.delete('/delete/:id', middleware_1.checkToken, deleteUser);
userRouter.get('/list', middleware_1.checkToken, getUsers);
async function getUsers(req, res) {
    const offset = req.query.offset || 0;
    const limit = req.query.limit || 10;
    const last_name = req.query.last_name || '';
    const first_name = req.query.first_name || '';
    const phone = req.query.phone || '';
    const email = req.query.email || '';
    const query = {
        last_name,
        first_name,
        phone,
        email
    };
    const users = await services_1.getUsersService(offset, limit, query);
    if (users) {
        const result = [];
        const total = users.hits.total.value;
        const data = users.hits.hits;
        for (let i = 0; i < data.length; i++) {
            const user = data[i];
            result.push(user._source);
        }
        response_1.sendSuccess({
            items: result,
            total
        }, res);
        return;
    }
    response_1.sendBadRequest(res, 'Có lỗi xảy ra');
}
async function register(req, res) {
    try {
        const isPermission = await middleware_1.checkPermission(req, res, 'user_create');
        if (!isPermission) {
            response_1.sendForbiddenRequest(res);
            return;
        }
        const body = req.body;
        const userByPhonel = await services_1.checkUniqueData(req.body.phone, req.body.email);
        if (userByPhonel) {
            const message = 'Số điện thoại hoặc email đã tồn tại';
            response_1.sendBadRequest(res, message);
            return;
        }
        const saltRounds = 10;
        let salt_key = '';
        await bcrypt.genSalt(saltRounds).then(salt => {
            salt_key = salt;
        });
        await bcrypt.hash(body.password, salt_key).then((hash) => {
            body.password = hash;
        });
        const user = await services_1.createUser(req.body);
        response_1.sendSuccess(user, res);
    }
    catch (e) {
        response_1.sendInternalServerErrorRequest(res);
    }
}
async function login(req, res) {
    const phone = req.body.phone.trim();
    const password = req.body.password.trim();
    const user = await services_1.getUserByPhone(phone);
    if (!user) {
        response_1.sendBadRequest(res, 'Số điện thoại không đúng');
        return;
    }
    const match = await bcrypt.compare(password, user.password);
    if (!match) {
        response_1.sendBadRequest(res, 'Mật khẩu không chính xác');
        return;
    }
    const exp = 24 * 60 * 60;
    const token = jwt.sign({
        id: user.id,
        phone: user.phone,
    }, process.env.secret_token, {
        expiresIn: exp,
    });
    response_1.sendSuccess(token, res);
}
async function update(req, res) {
    const isPermission = await middleware_1.checkPermission(req, res, 'user_update');
    if (!isPermission) {
        response_1.sendForbiddenRequest(res);
        return;
    }
    const body = req.body;
    const id = req.params.id;
    const exist_user = await services_1.getUserById(id);
    if (!exist_user) {
        response_1.sendBadRequest(res, `id ${id} không tồn tại`);
        return;
    }
    const exist_phone = await services_1.checkExistPhone(id, body.phone);
    if (exist_phone) {
        response_1.sendBadRequest(res, 'Số điện thoại đã tồn tại');
        return;
    }
    const exist_email = await services_1.checkExistEmail(id, body.email.trim());
    if (exist_email) {
        response_1.sendBadRequest(res, 'Email đã tồn tại');
    }
    await services_1.updateUserById(id, body);
    const user_new = await services_1.getUserById(id);
    response_1.sendSuccess(user_new, res);
}
async function deleteUser(req, res) {
    const isPermission = await middleware_1.checkPermission(req, res, 'user_delete');
    console.log(`=========${isPermission} =============`);
    if (!isPermission) {
        response_1.sendForbiddenRequest(res);
        return;
    }
    const id = req.params.id;
    const authHeader = req.headers.authorization;
    const token = authHeader.split(' ')[1];
    let decoded;
    decoded = jwt.verify(token, process.env.secret_token);
    if (parseInt(id) === parseInt(decoded.id)) {
        response_1.sendBadRequest(res, `Không thể xóa user có id ${id}`);
        return;
    }
    const user = await services_1.deleteUserById(id);
    if (user) {
        response_1.sendSuccess({ message: 'Xóa user thành công' }, res);
        return;
    }
    response_1.sendBadRequest(res, `id ${id} không tồn tại`);
}
