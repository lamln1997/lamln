require("dotenv").config();
import express, {ErrorRequestHandler, NextFunction} from "express";
import cors from "cors";
import bodyParser from  "body-parser";
import cookieParser from "cookie-parser";
import {errors} from "celebrate";
import morgan from "morgan";
import {apiRouter} from './controllers/api';

const app = express();

const corsOptions = {
    origin: 'http://localhost:4200',
    optionsSuccessStatus: 200
}
app.use(morgan('tiny'));
app.use(cors(corsOptions));
app.use(bodyParser.json());
app.use(express.urlencoded({ extended: true }));
app.use(cookieParser());
app.set("port", process.env.PORT || 3000);

app.use('/api/v1', apiRouter)

app.get("/", (req, res) => {
    res.send("The sedulous hyena ate the antelope!");
});
app.use(errors());
// TODO: Format error response
app.use(
    (
        err: Error,
        _req: express.Request,
        res: express.Response,
        _next: NextFunction
    ) => {
        console.error(err);
        res.header("Content-Type", "application/json");
        res.status(500).send(JSON.stringify(err, Object.getOwnPropertyNames(err)));
    }
);
export default app;

