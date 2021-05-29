import { validateShiftOperation } from '../validateOperation.js'

export const shiftCircleRight = (strNumber, repeat = 1) => {
  const validate = validateShiftOperation(strNumber, repeat)
  if (!validate.isCorrect) throw validate.error

  const lastBit = strNumber.slice(-1)
  const restBits = strNumber.slice(0, -1)
  const result = `${lastBit}${restBits}`
  if (repeat === 1) return result
  return shiftCircleRight(result, --repeat)
}

export const shiftCircleLeft = (strNumber, repeat = 1) => {
  const validate = validateShiftOperation(strNumber, repeat)
  if (!validate.isCorrect) throw validate.error

  const firstDigit = strNumber.slice(0, 1)
  const restBits = strNumber.slice(1)
  const result = `${restBits}${firstDigit}`
  if (repeat === 1) return result
  return shiftCircleLeft(result, --repeat)
}
