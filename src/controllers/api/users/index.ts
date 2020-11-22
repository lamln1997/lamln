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
    sendInternalServerErrorRequest
} from '../../../response'
import {
    checkToken
} from '../../middleware'
import {
    createUser,
    checkUniqueData,
    getUserByPhone,
    getUserById,
    updateUserById,
    checkExistPhone,
    checkExistEmail,
    deleteUserById
} from "../../services";

const userRouter = express.Router();
userRouter.post('/register', validatorRegisterUser, register);
userRouter.post('/login', validatorLogin, login)
userRouter.put('/update/:id', checkToken, validatorUpdate, update)
userRouter.delete('/delete/:id', checkToken, deleteUser)

async function register(req: express.Request, res: express.Response) {
    try {
        const body = req.body;
        const userByPhonel = await checkUniqueData(req.body.phone, req.body.email)
        if (userByPhonel) {
            const message = 'Số điện thoại hoặc email đã tồn tại';
            sendBadRequest(res, message);
            return;
        }
        const saltRounds = 10;
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
        sendBadRequest(res,'Số điện thoại không đúng');
        return;
    }
    const match = await bcrypt.compare(password, user.password);
    if (!match) {
        sendBadRequest(res, 'Mật khẩu không chính xác')
        return;
    }
    const exp = 24 * 60 * 60;
    let token = jwt.sign(
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
    const body = req.body;
    const id = req.params.id;
    const exist_user = await getUserById(id);
    if (!exist_user) {
        sendBadRequest(res, `id ${id} không tồn tại`);
        return;
    }
    const exist_phone = await checkExistPhone(id, body.phone);
    if (exist_phone) {
        sendBadRequest(res, 'Số điện thoại đã tồn tại');
        return;
    }
    const exist_email = await checkExistEmail(id, body.email.trim());
    if (exist_email) {
        sendBadRequest(res, 'Email đã tồn tại')
    }
    await updateUserById(id, body);
    const user_new = await getUserById(id);
    sendSuccess(user_new, res)
}

async function deleteUser(req: express.Request, res: express.Response) {
    const id = req.params.id;
    const authHeader = req.headers['authorization'];
    const token = authHeader.split(' ')[1];
    let decoded;
    decoded = jwt.verify(token, process.env.secret_token);
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