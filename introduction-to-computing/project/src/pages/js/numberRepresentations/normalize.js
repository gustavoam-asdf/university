import firstDigit from '../changeBase/firstDigit.js'
import { isInteger } from '../changeBase/validateNumber.js'

const firstDigitIsZero = strNumber => firstDigit(strNumber).asNumber === 0

const normalize = ({ unsignedNumber }) => {
  if (typeof unsignedNumber !== 'string')
    throw new TypeError('Argument must be a number type string')
  if (isInteger(unsignedNumber))
    return {
      exponent: unsignedNumber.length - 1,
      mantissa: unsignedNumber.slice(1)
    }
  const pointPosition = unsignedNumber.indexOf('.')

  if (firstDigitIsZero(unsignedNumber)) {
    const firstOnePosition = unsignedNumber.search(/1/)
    return {
      exponent: 1 - firstOnePosition,
      mantissa: unsignedNumber.slice(firstOnePosition + 1)
    }
  }

  return {
    exponent: pointPosition - 1,
    mantissa: unsignedNumber.slice(pointPosition + 1)
  }
}

export default normalize
