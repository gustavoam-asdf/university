import getInteger from '../getInteger.js'
import getRemainder from '../getRemainder.js'
import encodeHexadecimal from '../encodeHexadecimal.js'
/**
 * @param {Number} base
 * @param {Number} integer
 * @returns {String}
 */
const integerDecimalToAny = (base, integer) => {
  const absolute = Math.abs(integer)
  if (absolute < base) return encodeHexadecimal(absolute)
  const quotient = getInteger(absolute / base)
  const remainder = getRemainder(absolute, base)
  return `${integerDecimalToAny(base, quotient)}${remainder}`
}

export default integerDecimalToAny
