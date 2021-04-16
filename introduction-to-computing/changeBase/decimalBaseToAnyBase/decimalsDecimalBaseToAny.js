const getInteger = require('../getInteger')
const getDecimals = require('../getDecimals')
const encodeHexadecimal = require('../encodeHexadecimal')

/**
 * @param {Number} base
 * @param {Number} decimalPart
 * @param {Number} precision
 * @returns {String}
 */
const decimalsDecimalBaseToAny = (base, decimalPart, precision = 0) => {
  if (precision === 10) return ''
  const numberXdecimals = decimalPart * base
  if (numberXdecimals === 0) return 0
  const digitToLeave = encodeHexadecimal(getInteger(numberXdecimals))
  const remainder = getDecimals(numberXdecimals.toString()) - getDecimals(digitToLeave)
  return `${digitToLeave}${decimalsDecimalBaseToAny(base, remainder, ++precision)}`
}

module.exports = decimalsDecimalBaseToAny
