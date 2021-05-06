import decimalToAny from '../changeBase/decimalBaseToAnyBase/decimalToAny.js'
import firstDigit from '../changeBase/firstDigit.js'
import completeWithZeros from './completeWithZeros.js'

const decimalToBinary = (strNumber, precision = 100) => decimalToAny(2, strNumber, precision)

const normalize = ({ unsignedNumber }) => {
  if (typeof unsignedNumber !== 'string')
    throw new TypeError('Argument must be a number type string')
  const pointPosition = unsignedNumber.indexOf('.')
  let exponent = 0
  if (pointPosition === -1) return { exponent, mantissa: unsignedNumber.slice(2) }

  if (firstDigit(unsignedNumber).asNumber === 0) {
    const firstOne = unsignedNumber.search(/1/)

    exponent = (firstOne - 1) * -1
    // console.log({ firstOne, unsignedNumber, mantissa: unsignedNumber.slice(firstOne + 1) })
    return {
      exponent,
      mantissa: unsignedNumber.slice(firstOne + 1)
    }
  }

  const tmpMantissa = [...unsignedNumber.replace('.', '')]
  tmpMantissa.splice(1, 0, '.')
  return {
    exponent,
    mantissa: tmpMantissa.join('').slice(2)
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
// console.log(excess(1023, -0.0625))
// console.log(excess(1023, 0.625))
console.log(excess(1023, -1.225))
