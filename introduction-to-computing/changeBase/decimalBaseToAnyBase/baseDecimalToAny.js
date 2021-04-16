const getInteger = require('../getInteger')
const getDecimals = require('../getDecimals')
const integerDecimalBaseToAny = require('./integerDecimalBaseAny')
const decimalsDecimalBaseToAny = require('./decimalsDecimalBaseToAny')

// Convert a number in decimal base to another base
/**
 * @param {Number} base
 * @param {String} strNumber
 * @returns
 */
const baseDecimalToAny = (base, strNumber) => {
  const integerPart = integerDecimalBaseToAny(base, getInteger(strNumber))
  const decimalPart = decimalsDecimalBaseToAny(base, getDecimals(strNumber))
  return {
    number: `${integerPart}${decimalPart === 0 ? '' : `.${decimalPart}`}`,
    integer: integerPart,
    decimal: `0.${decimalPart}`
  }
}

module.exports = baseDecimalToAny
