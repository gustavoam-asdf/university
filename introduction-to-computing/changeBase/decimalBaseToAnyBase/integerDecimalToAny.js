const getInteger = require('../getInteger')
const getRemainder = require('../getRemainder')
const encodeHexadecimal = require('../encodeHexadecimal')
/**
 * @param {Number} base
 * @param {Number} integer
 * @returns {String}
 */
const integerDecimalToAny = (base, integer) => {
  if (integer < base) return encodeHexadecimal(integer)
  const quotient = getInteger(integer / base)
  const remainder = getRemainder(integer, base)
  return `${integerDecimalToAny(base, quotient)}${remainder}`
}

module.exports = integerDecimalToAny
