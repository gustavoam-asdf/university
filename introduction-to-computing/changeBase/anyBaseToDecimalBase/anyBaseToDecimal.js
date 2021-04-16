const getInteger = require('../getInteger')
const getDecimals = require('../getDecimals')
const integerAnyBaseToDecimal = require('./integerAnyBaseToDecimal')

// Convert a number in any base to decimal base

const anyBaseToDecimal = (base, strNumber) => {
  const integer = getInteger(strNumber)
  const decimals = getDecimals(strNumber)
  return {
    integer: integerAnyBaseToDecimal(base, integer),
    decimals: 0
  }
}

module.exports = anyBaseToDecimal
