import * as express from "express";
import * as jwt from 'jsonwebtoken';
import {
    sendUnauthenticatedRequest
} from '../../response';
import {getUserById} from "../services"
export async function checkToken(req: express.Request, res: express.Response, next) {
    const authHeader = req.headers['authorization'];
    if (authHeader !== undefined) {
        const token = authHeader.split(' ')[1];
        try {
            let decoded;
            decoded = jwt.verify(token, process.env.secret_token);
            const user = await getUserById(decoded.id);
            if (user) {
                next();
                return;
            }
            sendUnauthenticatedRequest(res);
            return;
        } catch (e) {
            sendUnauthenticatedRequest(res);
            return;
        }
    }
    sendUnauthenticatedRequest(res);
}
module.exports = {
    checkToken
}
