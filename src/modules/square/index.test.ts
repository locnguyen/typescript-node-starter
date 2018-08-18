import { square } from '~/modules/square';

describe('A squaring function', () => {
    it('should square the argument and return the result', () => {
        const result = square(8);
        expect(result).toBe(64);
    });
});
