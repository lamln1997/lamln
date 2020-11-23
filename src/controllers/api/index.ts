import * as express from "express";
const apiRouter = express.Router();

import {userRouter} from './users';
import {permissionRouter} from './permissions';
import {roleRouter} from './roles';
import {checkToken} from "../middleware";

apiRouter.use('/user', userRouter);
apiRouter.use('/permission', checkToken, permissionRouter);
apiRouter.use('/role',checkToken, roleRouter);

export {apiRouter};
