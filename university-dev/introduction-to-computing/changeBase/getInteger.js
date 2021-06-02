// Another way to use numbers in Javascript because in this the numbers are implemented are really bad

const isHex = require('./isHex')

/**
 * @param {Number} number
 * @returns {String}
 */
const getInteger = number => {
  const strNumber = number.toString()
  if (!isHex(strNumber)) throw new TypeError('Argument most be a number')
  const floatingPoint = strNumber.indexOf('.')
  if (floatingPoint === -1) return number
  return strNumber.slice(0, floatingPoint)
}

module.exports = getInteger
