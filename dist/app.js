"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
require("dotenv").config();
const express_1 = __importDefault(require("express"));
const cors_1 = __importDefault(require("cors"));
const body_parser_1 = __importDefault(require("body-parser"));
const cookie_parser_1 = __importDefault(require("cookie-parser"));
const celebrate_1 = require("celebrate");
const morgan_1 = __importDefault(require("morgan"));
const api_1 = require("./controllers/api");
const app = express_1.default();
const corsOptions = {
    origin: 'http://localhost"4200',
    optionsSuccessStatus: 200
};
app.use(morgan_1.default('tiny'));
app.use(cors_1.default(corsOptions));
app.use(body_parser_1.default.json());
app.use(express_1.default.urlencoded({ extended: true }));
app.use(cookie_parser_1.default());
app.set("port", process.env.PORT || 3000);
app.use('/api/v1', api_1.apiRouter);
app.get("/", (req, res) => {
    res.send("The sedulous hyena ate the antelope!");
});
app.use(celebrate_1.errors());
app.use((err, _req, res, _next) => {
    console.error(err);
    res.header("Content-Type", "application/json");
    res.status(500).send(JSON.stringify(err, Object.getOwnPropertyNames(err)));
});
exports.default = app;
