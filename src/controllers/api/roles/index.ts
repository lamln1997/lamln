import * as express from "express";
import {
    createRole,
    getRoleById,
    updateRole
} from '../../services';
import {
    sendSuccess,
    sendBadRequest,
    sendInternalServerErrorRequest
} from '../../../response';

const roleRouter = express.Router();
roleRouter.post('/register', create);
roleRouter.put('/update/:id', update)
async function create(req: express.Request, res: express.Response) {
    console.log('create role');
    try {
        const body = req.body;
        const role = await createRole(body);
        if (role) {
            sendSuccess(role, res);
            return;
        }
        sendBadRequest(res, 'Có lỗi xảy ra');
    } catch (e) {
        sendInternalServerErrorRequest(res);
    }
}

async function update(req: express.Request, res: express.Response) {
    try {
        const id = req.params.id;
        const body = req.body;
        const data = await getRoleById(id);
        if (!data) {
            sendBadRequest(res, `Không tồn tại role với id ${id}`);
            return;
        }
        const role = await updateRole(id, body);
        if (role) {
            sendSuccess(role[1][0], res);
            return;
        }
        sendBadRequest(res, 'Có lỗi xảy ra');
    } catch (e) {
        sendInternalServerErrorRequest(res);
    }
}
export {
    roleRouter
}