import decimalToAny from '../changeBase/decimalBaseToAnyBase/decimalToAny.js'
import completeWithZeros from './completeWithZeros.js'

const decimalToBinary = (strNumber, precision = 100) => decimalToAny(2, strNumber, precision)

const normalize = ({ unsignedNumber }, mantissaLength) => {
  if (typeof unsignedNumber !== 'string')
    throw new TypeError('Argument must be a number type string')
  const pointPosition = unsignedNumber.indexOf('.')
  const exponent = pointPosition === -1 ? 0 : pointPosition - 1
  if (exponent === 0) return { exponent, mantissa: unsignedNumber.slice(2) }
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

  console.log(`A binario: ${binaryNumber.unsignedNumber}`)
  console.log(`Exponente: ${exponent}`)
  console.log(`Mantissa: ${mantissa}`)
  return {
    sign: binaryNumber.sign,
    exponent: completeWithZeros(decimalToBinary(exponent + shift), exponentLength),
    mantissa: completeWithZeros({ unsignedNumber: mantissa }, mantissaLength, 'right')
  }
}

console.log(excess(127, -14.5))
