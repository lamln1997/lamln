import * as express from "express";

import {
    createPermission,
    getPermissionById,
    update
} from '../../services'
import {
    sendSuccess,
    sendBadRequest,
    sendInternalServerErrorRequest
} from '../../../response'
import {
    checkToken
} from '../../middleware'

const permissionRouter = express.Router();

permissionRouter.post('/register', checkToken, registerPermission)
permissionRouter.put('/update/:id', checkToken, updatePermission)
async function registerPermission(req: express.Request, res: express.Response) {
    try {
        const body = req.body;
        const permission = await createPermission(body);
        if (permission) {
            sendSuccess(permission, res);
            return;
        }
        sendBadRequest(res,  'Có lỗi xảy ra');
    } catch (e) {
        sendInternalServerErrorRequest(res);
    }
}

async function updatePermission(req: express.Request, res: express.Response) {
    try {
        const body = req.body;
        const id = req.params.id;
        const data = await getPermissionById(id);
        if (!data) {
            sendBadRequest(res, `Không tồn tại id ${id}`);
            return;
        }
        const permission = await update(body, id);
        if (permission) {
            sendSuccess(permission[1][0], res);
            return;
        }
    } catch (e) {
        sendInternalServerErrorRequest(res);
    }
}

export {
    permissionRouter
}