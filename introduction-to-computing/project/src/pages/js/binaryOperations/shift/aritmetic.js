import { validateShiftOperation } from '../validateOperation.js'

export const shiftAritmeticRight = (strNumber, repeat = 1) => {
  const validate = validateShiftOperation(strNumber, repeat)
  if (!validate.isCorrect) throw validate.error

  const significantBit = strNumber.slice(0, 1)
  const restBits = strNumber.slice(0, -1)
  const result = `${significantBit}${restBits}`
  if (repeat === 1) return result
  if (repeat >= strNumber.length) return significantBit.repeat(strNumber.length)
  return shiftAritmeticRight(result, --repeat)
}

export const shiftAritmeticLeft = (strNumber, repeat = 1) => {
  const validate = validateShiftOperation(strNumber, repeat)
  if (!validate.isCorrect) throw validate.error

  const restBits = strNumber.slice(1)
  const result = `${restBits}0`
  if (repeat === 1) return result
  if (repeat >= strNumber.length) return '0'.repeat(strNumber.length)
  return shiftAritmeticLeft(result, --repeat)
}
