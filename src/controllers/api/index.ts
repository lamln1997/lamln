import * as express from "express";
const apiRouter = express.Router();

import {userRouter} from './users';
import {permissionRouter} from './permissions';
import {roleRouter} from './roles';
import {checkToken} from "../middleware";

apiRouter.use('/users', userRouter);
apiRouter.use('/permissions', checkToken, permissionRouter);
apiRouter.use('/roles',checkToken, roleRouter);

export {apiRouter};