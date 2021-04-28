import firstDigit from './firstDigit.js'

/**
 * @param {String} strNumber
 * @returns
 */
export const isHex = strNumber => {
  const temp = strNumber.toString()
  return temp.search(/^[0-9A-F]+(\.[0-9A-F]+)?$/) !== -1
}

/**
 * @param {String} strNumber
 * @returns
 */
export const isNumber = strNumber => {
  return strNumber.search(/^[0-9]+(\.[0-9]+)?$/) !== -1
}

/**
 * @param {String} strNumber
 * @returns
 */
export const isInteger = strNumber => {
  return strNumber.search(/^[0-9]+$/) !== -1
}

export const existInBase = (strNumber, base) => {
  const digit = firstDigit(strNumber)
  if (strNumber.length === 1) return digit.asNumber <= base
  if (digit.asNumber >= base) return false
  return existInBase(strNumber.slice(digit.length), base)
}
