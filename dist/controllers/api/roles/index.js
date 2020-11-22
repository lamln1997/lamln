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
exports.roleRouter = void 0;
const express = __importStar(require("express"));
const services_1 = require("../../services");
const response_1 = require("../../../response");
const roleRouter = express.Router();
exports.roleRouter = roleRouter;
roleRouter.post('/register', create);
roleRouter.put('/update/:id', update);
async function create(req, res) {
    console.log('create role');
    try {
        const body = req.body;
        const role = await services_1.createRole(body);
        if (role) {
            response_1.sendSuccess(role, res);
            return;
        }
        response_1.sendBadRequest(res, 'Có lỗi xảy ra');
    }
    catch (e) {
        response_1.sendInternalServerErrorRequest(res);
    }
}
async function update(req, res) {
    try {
        const id = req.params.id;
        const body = req.body;
        const data = await services_1.getRoleById(id);
        if (!data) {
            response_1.sendBadRequest(res, `Không tồn tại role với id ${id}`);
            return;
        }
        const role = await services_1.updateRole(id, body);
        if (role) {
            response_1.sendSuccess(role[1][0], res);
            return;
        }
        response_1.sendBadRequest(res, 'Có lỗi xảy ra');
    }
    catch (e) {
        response_1.sendInternalServerErrorRequest(res);
    }
}
