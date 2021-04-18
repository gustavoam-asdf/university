const getInteger = require('../getInteger')
const getDecimals = require('../getDecimals')
const integerAnyBaseToDecimal = require('./integerAnyToDecimal')
const decimalsAnyToDecimal = require('./decimalsAnyToDecimal')

// Convert a number in any base to decimal base

const anyToDecimal = (base, strNumber) => {
  const integerPart = integerAnyBaseToDecimal(base, getInteger(strNumber))
  const decimalPart = decimalsAnyToDecimal(base, getDecimals(strNumber).slice(2))
  return {
    base: 10,
    number: integerPart + decimalPart,
    integer: integerPart,
    decimals: decimalPart
  }
}

module.exports = anyToDecimal
