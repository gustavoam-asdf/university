const getInteger = require('../getInteger')
const getDecimals = require('../getDecimals')
const integerDecimalToAny = require('./integerDecimalToAny')
const decimalsDecimalToAny = require('./decimalsDecimalToAny')

// Convert a number in decimal base to another base
/**
 * @param {Number} base
 * @param {String} strNumber
 * @returns
 */
const decimalToAny = (base, strNumber) => {
  const integerPart = integerDecimalToAny(base, getInteger(strNumber))
  const decimalPart = getDecimals(`0.${decimalsDecimalToAny(base, getDecimals(strNumber))}`)
  return {
    base,
    number: `${integerPart}${decimalPart === '0' ? '' : `${decimalPart.slice(1)}`}`,
    integer: integerPart,
    decimal: decimalPart
  }
}

module.exports = decimalToAny
