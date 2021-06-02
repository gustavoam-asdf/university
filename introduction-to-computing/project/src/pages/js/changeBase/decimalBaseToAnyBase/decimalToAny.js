import getInteger from '../getInteger.js'
import getDecimals from '../getDecimals.js'
import integerDecimalToAny from './integerDecimalToAny.js'
import decimalsDecimalToAny from './decimalsDecimalToAny.js'

// Convert a number in decimal base to another base
/**
 * @param {Number} base
 * @param {String} strNumber
 * @returns
 */
const decimalToAny = (base, strNumber, precision = 100) => {
  const sign = strNumber[0] === '-' ? '-' : ''
  const integerPart = integerDecimalToAny(base, getInteger(strNumber))
  const decimalPart = decimalsDecimalToAny(base, getDecimals(strNumber), precision)
  return {
    base,
    sign: sign === '' ? '0' : '1',
    number: `${sign}${integerPart}${decimalPart !== '' ? `.${decimalPart}` : ''}`,
    unsignedNumber: `${integerPart}${decimalPart !== '' ? `.${decimalPart}` : ''}`,
    integer: integerPart,
    decimal: decimalPart
  }
}

export default decimalToAny
