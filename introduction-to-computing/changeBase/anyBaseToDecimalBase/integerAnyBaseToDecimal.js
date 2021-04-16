const decodeHexadecimal = require('../decodeHexadecimal')

/**
 * @param {Number} base
 * @param {String} strInteger
 */
const integerAnyBaseToDecimal = (base, strInteger) => {
  const search = strInteger.match(/[0-9A-F]|(\(\d+\))/)
  const digit = {
    asNumber: decodeHexadecimal(search[0]),
    asText: search[0],
    position: search.index
  }
  if (strInteger.length === 1) return digit.asNumber
  const positionValue = base ** (strInteger.length - 1)
  return digit.asNumber * positionValue + integerAnyBaseToDecimal(base, strInteger.slice(1))
}

module.exports = integerAnyBaseToDecimal
