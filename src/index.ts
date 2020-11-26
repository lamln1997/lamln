import {start} from  './start-server';

start().catch(err => {
    console.log(`======= fail with message: ${err} =======`)
});
