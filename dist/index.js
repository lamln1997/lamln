"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const start_server_1 = require("./start-server");
start_server_1.start().catch(err => {
    console.log(`======= fail with message: ${err} =======`);
});
