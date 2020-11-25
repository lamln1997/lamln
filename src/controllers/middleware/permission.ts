import * as express from 'express';
import * as jwt from 'jsonwebtoken';
import {
    getUserById
} from '../services';
async function checkPermission(req: express.Request, res: express.Response, permission: string) {
    const authHeader = req.headers['authorization'];
    if (authHeader !== undefined) {
        const token = authHeader.split(' ')[1];
        let decoded;
        decoded = jwt.verify(token, process.env.secret_token);
        const user_id = decoded.id;
        const user = await getUserById(user_id, permission);
        const roles = user.roles;
        let isPermission  = false

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
export {
    checkPermission
}