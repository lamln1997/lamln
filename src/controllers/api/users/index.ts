import * as express from "express"
import * as bcrypt from 'bcrypt'
import * as jwt from 'jsonwebtoken';
import {
    validatorRegisterUser,
    validatorLogin,
    validatorUpdate
} from '../../validates/users/index';
import {
    sendSuccess,
    sendBadRequest,
    sendInternalServerErrorRequest, sendForbiddenRequest
} from '../../../response'
import {
    checkToken,
    checkPermission
} from '../../middleware'
import {
    createUser,
    checkUniqueData,
    getUserByPhone,
    getUserById,
    updateUserById,
    checkExistPhone,
    checkExistEmail,
    deleteUserById,
    getUsersService
} from "../../services";

const userRouter = express.Router();
userRouter.post('/register', validatorRegisterUser, register);
userRouter.post('/login', validatorLogin, login)
userRouter.put('/update/:id', checkToken, validatorUpdate, update)
userRouter.delete('/delete/:id', checkToken, deleteUser)
userRouter.get('/list', checkToken, getUsers)

async function getUsers(req: express.Request, res: express.Response) {
    const offset = req.query.offset || 0;
    const limit = req.query.limit || 10;
    const name = req.query.name;
    // tslint:disable-next-line:variable-name
    const last_name = req.query.last_name || '';
    const query = {
        offset,
        limit,
        last_name
    }
    console.log(query);
    const users = await getUsersService(query);
    sendSuccess(users, res)
}

async function register(req: express.Request, res: express.Response) {
    try {
        const isPermission = await checkPermission(req, res, 'user_create');
        if (!isPermission) {
            sendForbiddenRequest(res);
            return;
        }
        const body = req.body;
        const userByPhonel = await checkUniqueData(req.body.phone, req.body.email)
        if (userByPhonel) {
            const message = 'Số điện thoại hoặc email đã tồn tại';
            sendBadRequest(res, message);
            return;
        }
        const saltRounds = 10;
        // tslint:disable-next-line:variable-name
        let salt_key = '';
        await bcrypt.genSalt(saltRounds).then(
            salt => {
                salt_key = salt
            }
        )
        await bcrypt.hash(body.password, salt_key).then((hash) => {
            body.password = hash;
        })
        const user = await createUser(req.body);
        sendSuccess(user, res)
    } catch (e) {
        sendInternalServerErrorRequest(res)
    }
}

async function login(req: express.Request, res: express.Response) {
    const phone = req.body.phone.trim();
    const password = req.body.password.trim();
    const user = await getUserByPhone(phone);
    if (!user) {
        sendBadRequest(res, 'Số điện thoại không đúng');
        return;
    }
    const match = await bcrypt.compare(password, user.password);
    if (!match) {
        sendBadRequest(res, 'Mật khẩu không chính xác')
        return;
    }
    const exp = 24 * 60 * 60;
    const token = jwt.sign(
        {
            id: user.id,
            phone: user.phone,
        },
        process.env.secret_token,
        {
            expiresIn: exp,
        }
    );
    sendSuccess(token, res);
}

async function update(req: express.Request, res: express.Response) {
    const isPermission = await checkPermission(req, res, 'user_update');
    if (!isPermission) {
        sendForbiddenRequest(res);
        return;
    }
    const body = req.body;
    const id = req.params.id;
    // tslint:disable-next-line:variable-name
    const exist_user = await getUserById(id);
    if (!exist_user) {
        sendBadRequest(res, `id ${id} không tồn tại`);
        return;
    }
    // tslint:disable-next-line:variable-name
    const exist_phone = await checkExistPhone(id, body.phone);
    if (exist_phone) {
        sendBadRequest(res, 'Số điện thoại đã tồn tại');
        return;
    }
    // tslint:disable-next-line:variable-name
    const exist_email = await checkExistEmail(id, body.email.trim());
    if (exist_email) {
        sendBadRequest(res, 'Email đã tồn tại')
    }
    await updateUserById(id, body);
    // tslint:disable-next-line:variable-name
    const user_new = await getUserById(id);
    sendSuccess(user_new, res)
}

async function deleteUser(req: express.Request, res: express.Response) {
    const isPermission = await checkPermission(req, res, 'user_delete');
    console.log(`=========${isPermission} =============`);
    if (!isPermission) {
        sendForbiddenRequest(res);
        return;
    }
    const id = req.params.id;
    const authHeader = req.headers.authorization;
    const token = authHeader.split(' ')[1];
    let decoded;
    decoded = jwt.verify(token, process.env.secret_token);
    // tslint:disable-next-line:radix
    if (parseInt(id) === parseInt(decoded.id)) {
        sendBadRequest(res, `Không thể xóa user có id ${id}`);
        return;
    }
    const user = await deleteUserById(id);
    if (user) {
        sendSuccess({message: 'Xóa user thành công'}, res);
        return;
    }
    sendBadRequest(res, `id ${id} không tồn tại`);
}

export {userRouter};
