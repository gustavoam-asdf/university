/**
 * @param {String} strDigit
 * @returns {Number}
 */
const decodeHexadecimal = strDigit => {
  const digit = strDigit.search(/^(\(\d+\))$/) === -1 ? strDigit : strDigit.slice(1, -1)
  if (digit.search(/^[0-9A-F]+$/) === -1)
    throw new TypeError('Argument must be a number with hexadecimals')
  if (digit.length !== 1)
    return [...digit].reduce((acc, curr, i) => (acc += decodeHexadecimal(curr)), 0)
  if (digit === 'A') return 10
  else if (digit === 'B') return 11
  else if (digit === 'C') return 12
  else if (digit === 'D') return 13
  else if (digit === 'E') return 14
  else if (digit === 'F') return 15
  else return parseFloat(digit)
}

module.exports = decodeHexadecimal
