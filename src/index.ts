if (process.env.NODE_ENV !== 'development') {
    require('module-alias/register'); // tslint:disable-line
}

import { square } from '~/modules/square';

console.log(`4^2 = ${square(4)}`);
