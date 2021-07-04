import getInteger from '../getInteger.js'
import getDecimals from '../getDecimals.js'
import integerAnyBaseToDecimal from './integerAnyToDecimal.js'
import decimalsAnyToDecimal from './decimalsAnyToDecimal.js'

// Convert a number in any base to decimal base
/**
 * @param {Number} base
 * @param {String} strNumber
 * @returns
 */
const anyToDecimal = (base, strNumber) => {
  const sign = strNumber.charAt(0) === '-' ? '-' : ''
  const integerPart = integerAnyBaseToDecimal(base, getInteger(strNumber))
  const decimalPart = decimalsAnyToDecimal(base, getDecimals(strNumber).slice(2))
  return {
    base: 10,
    sign: sign === '' ? '0' : '1',
    number: `${sign}${Number(integerPart) + Number(decimalPart)}`,
    unsignedNumber: `${Number(integerPart) + Number(decimalPart)}`,
    integer: integerPart,
    decimals: decimalPart
  }
}

export default anyToDecimal
