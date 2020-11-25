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
exports.checkPermission = void 0;
const jwt = __importStar(require("jsonwebtoken"));
const services_1 = require("../services");
async function checkPermission(req, res, permission) {
    const authHeader = req.headers['authorization'];
    if (authHeader !== undefined) {
        const token = authHeader.split(' ')[1];
        let decoded;
        decoded = jwt.verify(token, process.env.secret_token);
        const user_id = decoded.id;
        const user = await services_1.getUserById(user_id, permission);
        const roles = user.roles;
        let isPermission = false;
        for (let i = 0; i < roles.length; i++) {
            const role = roles[i];
            const permissions = role.permissions;
            for (let j = 0; j < permissions.length; j++) {
                const per = permissions[j];
                if (per.name === permission) {
                    isPermission = true;
                    console.log('==============co quyen ========= ');
                    break;
                }
            }
            if (isPermission) {
                break;
            }
        }
        console.log(`==========gia tri cua isPermission ${isPermission}===========`);
        return isPermission;
    }
}
exports.checkPermission = checkPermission;
