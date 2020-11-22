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
exports.apiRouter = void 0;
const express = __importStar(require("express"));
const apiRouter = express.Router();
exports.apiRouter = apiRouter;
const users_1 = require("./users");
const permissions_1 = require("./permissions");
const roles_1 = require("./roles");
const middleware_1 = require("../middleware");
apiRouter.use('/users', users_1.userRouter);
apiRouter.use('/permissions', middleware_1.checkToken, permissions_1.permissionRouter);
apiRouter.use('/roles', middleware_1.checkToken, roles_1.roleRouter);