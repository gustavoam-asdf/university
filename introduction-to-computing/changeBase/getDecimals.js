// Another way to use numbers in Javascript because in this the numbers are implemented are really bad

/**
 * @param {String} strNumber
 */
const getDecimals = strNumber => {
  if (isNaN(strNumber)) throw new TypeError('Argument most be a number')
  let decimalPart = 0
  let decimalsIndex = strNumber.indexOf('.')
  if (decimalsIndex !== -1) {
    decimalPart = parseFloat(`0.${strNumber.slice(decimalsIndex + 1)}`)
  }
  return decimalPart.toString()
}

module.exports = getDecimals
