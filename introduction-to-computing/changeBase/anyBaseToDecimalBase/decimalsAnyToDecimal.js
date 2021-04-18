const decodeHexadecimal = require('../decodeHexadecimal')

/**
 * @param {Number} base
 * @param {String} strDecimals only decimal part
 */
const decimalsAnyToDecimal = (base, strDecimals, init = -1) => {
  const digit = decodeHexadecimal(strDecimals === '' ? '0' : strDecimals.slice(0, 1))
  const positionValue = base ** init
  if (strDecimals.length <= 1) return digit * positionValue
  return digit * positionValue + decimalsAnyToDecimal(base, strDecimals.slice(1), --init)
}

module.exports = decimalsAnyToDecimal
