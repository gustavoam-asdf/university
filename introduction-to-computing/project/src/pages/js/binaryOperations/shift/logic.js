import { validateShiftOperation } from '../validateOperation.js'

export const shiftLogicRight = (strNumber, repeat = 1) => {
  const validate = validateShiftOperation(strNumber, repeat)
  if (!validate.isCorrect) throw validate.error

  const restBits = strNumber.slice(0, -1)
  const result = `0${restBits}`
  if (repeat === 1) return result
  if (repeat >= strNumber.length) return '0'.repeat(strNumber.length)
  return shiftLogicRight(result, --repeat)
}

export const shiftLogicLeft = (strNumber, repeat = 1) => {
  const validate = validateShiftOperation(strNumber, repeat)
  if (!validate.isCorrect) throw validate.error

  const restBits = strNumber.slice(1)
  const result = `${restBits}0`
  if (repeat === 1) return result
  if (repeat >= strNumber.length) return '0'.repeat(strNumber.length)
  return shiftLogicLeft(result, --repeat)
}
