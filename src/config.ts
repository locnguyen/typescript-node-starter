import * as dotenv from 'dotenv';

const options = {
    silent: !['development', 'test'].includes(process.env.NODE_ENV)
};

dotenv.config(options);

const config = {
    LOG_LEVEL: process.env.LOG_LEVEL || 'debug',
    NODE_ENV: process.env.NODE_ENV || 'development',
    PORT: process.env.PORT || '8080'
};

export { config };
