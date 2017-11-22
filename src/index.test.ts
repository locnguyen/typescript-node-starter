import { square } from './index';
import { expect } from 'chai';

describe('A squaring function', () => {
    it('should square the argument and return the result', () => {
        const result = square(8);
        expect(result).to.be.equal(64);
    });
});
