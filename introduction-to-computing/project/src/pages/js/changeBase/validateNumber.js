import firstDigit from './firstDigit.js'

/**
 * @param {String} strNumber
 * @returns
 */
export const isHex = strNumber => {
  const temp = strNumber.toString()
  return temp.search(/^-?[0-9A-F]+(\.[0-9A-F]+)?$/) !== -1
}
/*  strNumber = "AB"
    temp = true;
*/

/**
 * @param {String} strNumber
 * @returns
 */
export const isNumber = strNumber => {
  return strNumber.search(/^-?[0-9]+(\.[0-9]+)?$/) !== -1
}
/*  strNumber = ".510"
    return true;
*/

/**
 * @param {String} strNumber
 * @returns
 */
export const isInteger = strNumber => {
  return strNumber.search(/^-?[0-9]+$/) !== -1
}

/*  strNumber = "10"
    return true;
*/

export const existInBase = (strNumber, base) => {
  const digit = firstDigit(strNumber)
  console.log(digit)
  if (strNumber.length === 1) return digit.asNumber <= base
  if (digit.asNumber >= base) return false
  return existInBase(strNumber.slice(digit.length), base)
}

/*  strNumber = "123"
    base = 4
    digit = {
    asNumber: 1
    asText: "1"
    length: 1
    };
*/
