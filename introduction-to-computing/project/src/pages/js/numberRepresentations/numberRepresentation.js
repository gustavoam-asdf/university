import decimalToAny from '../changeBase/decimalBaseToAnyBase/decimalToAny.js'
import firstDigit from '../changeBase/firstDigit.js'
import { isInteger } from '../changeBase/validateNumber.js'
import completeWithZeros from './completeWithZeros.js'

const decimalToBinary = (strNumber, precision = 100) => decimalToAny(2, strNumber, precision)

const firstDigitIsZero = strNumber => firstDigit(strNumber).asNumber === 0

const shiftPoint = strNumber => {
  if (typeof strNumber !== 'string') throw new TypeError('Number must be a number type string')
  if (isInteger(strNumber)) return { shifted: strNumber.length - 1, decimals: strNumber.slice(1) }
  const pointPosition = strNumber.indexOf('.')

  if (firstDigitIsZero(strNumber)) {
    const firstOnePosition = strNumber.search(/1/)
    return { shifted: 1 - firstOnePosition, decimals: strNumber.slice(firstOnePosition + 1) }
  }

  return { shifted: pointPosition - 1, decimals: strNumber.slice(pointPosition + 1) }
}

const normalize = ({ unsignedNumber }) => {
  if (typeof unsignedNumber !== 'string')
    throw new TypeError('Argument must be a number type string')
  const { shifted, decimals } = shiftPoint(unsignedNumber)
  return {
    exponent: shifted,
    mantissa: decimals
  }
}

const excess = (shift, number) => {
  if (typeof shift !== 'number') throw new TypeError('Shift must be a number')
  if (shift !== 127 && shift !== 1023) throw new Error('Invalid, shift must be 123 or 1023')
  let exponentLength
  let mantissaLength
  if (shift === 127) {
    exponentLength = 8
    mantissaLength = 23
  } else {
    exponentLength = 11
    mantissaLength = 52
  }
  const binaryNumber = decimalToBinary(number)
  const { exponent, mantissa } = normalize(binaryNumber)
  return {
    sign: binaryNumber.sign,
    exponent: completeWithZeros(decimalToBinary(exponent + shift), exponentLength),
    mantissa: completeWithZeros({ unsignedNumber: mantissa }, mantissaLength, 'right', true)
  }
}

console.log(excess(1023, 0.0025))
console.log(excess(1023, -0.0025))
console.log(excess(1023, 0.0625))
console.log(excess(1023, -0.0625))
console.log(excess(1023, 0.625))
console.log(excess(1023, -1.225))
console.log(excess(1023, 25))
