const decodeDigitHexadecimal = require('../decodeDigitHexadecimal')
const firstDigit = require('../firstDIgit')

/**
 * @param {Number} base
 * @param {String} strDecimals only decimal part
 */
const decimalsAnyToDecimal = (base, strDecimals, init = -1) => {
  const digit = firstDigit(strDecimals)
  const positionValue = base ** init
  if (strDecimals.length <= 1) return digit.asNumber * positionValue
  return (
    digit.asNumber * positionValue +
    decimalsAnyToDecimal(base, strDecimals.slice(digit.length), --init)
  )
}

module.exports = decimalsAnyToDecimal
