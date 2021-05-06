import { isInteger } from '../changeBase/validateNumber.js'
import findNearestLenght from './findNearestLenght.js'

/**
 * @param {String} strNumber
 * @param {Number} bits
 * @returns
 */
const completeWithZeros = ({ unsignedNumber }, bits = 0, position = 'left') => {
  if (typeof unsignedNumber !== 'string') throw new TypeError('Number must be of type string')
  if (!isInteger(unsignedNumber))
    throw new TypeError('Main argument is not a "number", it is a "array" of digits ')
  if (bits === 0) bits = findNearestLenght(unsignedNumber.length, 2)
  if (unsignedNumber.length > bits) throw new Error('Ocurred a overflow')
  if (position === 'left') {
    return `${'0'.repeat(bits - unsignedNumber.length)}${unsignedNumber}`
  } else if (position === 'right') {
    return `${unsignedNumber}${'0'.repeat(bits - unsignedNumber.length)}`
  } else {
    throw new TypeError('Position must be type string: "left" or "right"')
  }
}

export default completeWithZeros
