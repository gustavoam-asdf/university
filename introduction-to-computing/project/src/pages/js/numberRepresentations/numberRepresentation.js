import decimalToAny from '../changeBase/decimalBaseToAnyBase/decimalToAny.js'

const findNearestBaseExponent = (numberLength, base, exp = 0) => {
  if (typeof numberLength !== 'number') throw new TypeError('Number length must be a number')
  if (base ** exp >= numberLength) return base ** exp
  return findNearestBaseExponent(numberLength, base, ++exp)
}

/**
 * @param {String} strNumber
 * @param {Number} bits
 * @returns
 */
const completeBinaryDigits = (strNumber, bits = 0) => {
  if (typeof strNumber !== 'string') throw new TypeError('Number must be of type string')
  if (bits === 0) {
    bits = findNearestBaseExponent(strNumber.length, 2)
  }
  return `${'0'.repeat(bits - strNumber.length)}${strNumber}`
}

const number = 0.625,
  bits = 16

const decimalToBinary = strNumber => decimalToAny(2, strNumber)
console.log(decimalToBinary(number).number)
console.log(completeBinaryDigits(decimalToBinary(number).number))
