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
exports.permissionRouter = void 0;
const express = __importStar(require("express"));
const services_1 = require("../../services");
const response_1 = require("../../../response");
const middleware_1 = require("../../middleware");
const permissionRouter = express.Router();
exports.permissionRouter = permissionRouter;
permissionRouter.post('/register', middleware_1.checkToken, registerPermission);
permissionRouter.put('/update/:id', middleware_1.checkToken, updatePermission);
async function registerPermission(req, res) {
    try {
        const body = req.body;
        const permission = await services_1.createPermission(body);
        if (permission) {
            response_1.sendSuccess(permission, res);
            return;
        }
        response_1.sendBadRequest(res, 'Có lỗi xảy ra');
    }
    catch (e) {
        response_1.sendInternalServerErrorRequest(res);
    }
}
async function updatePermission(req, res) {
    try {
        const body = req.body;
        const id = req.params.id;
        const data = await services_1.getPermissionById(id);
        if (!data) {
            response_1.sendBadRequest(res, `Không tồn tại id ${id}`);
            return;
        }
        const permission = await services_1.update(body, id);
        if (permission) {
            response_1.sendSuccess(permission[1][0], res);
            return;
        }
    }
    catch (e) {
        response_1.sendInternalServerErrorRequest(res);
    }
}
