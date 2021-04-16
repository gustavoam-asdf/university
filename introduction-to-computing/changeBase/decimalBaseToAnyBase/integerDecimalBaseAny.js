const getInteger = require('../getInteger')
const getRemainder = require('../getRemainder')
const encodeHexadecimal = require('../encodeHexadecimal')
/**
 * @param {Number} base
 * @param {Number} integer
 * @returns {String}
 */
const integerDecimalBaseToAny = (base, integer) => {
  if (integer < base) return encodeHexadecimal(integer)
  const quotient = getInteger(integer / base)
  const remainder = getRemainder(integer, base)
  return `${integerDecimalBaseToAny(base, quotient)}${remainder}`
}

module.exports = integerDecimalBaseToAny
