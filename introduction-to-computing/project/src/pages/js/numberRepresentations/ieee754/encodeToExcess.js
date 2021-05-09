import decimalToAny from '../../changeBase/decimalBaseToAnyBase/decimalToAny.js'
import completeWithZeros from '../completeWithZeros.js'
import normalize from '../normalize.js'

const decimalToBinary = (strNumber, precision = 100) => decimalToAny(2, strNumber, precision)

const encodeToExcess = (shift, number) => {
  if (typeof shift !== 'number') throw new TypeError('Shift must be a number')
  if (shift !== 127 && shift !== 1023) throw new Error('Invalid, shift must be 127 or 1023')
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

export default encodeToExcess
