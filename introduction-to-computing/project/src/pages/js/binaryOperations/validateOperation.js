import { existInBase } from '../changeBase/validateNumber.js'

export const validateShiftOperation = (strNumber, repeat) => {
  const response = { isCorrect: true, error: null }
  if (typeof strNumber !== 'string') {
    response.isCorrect = false
    response.error = new TypeError('Number must be strNumber type string')
  }
  if (typeof repeat !== 'number') {
    response.isCorrect = false
    response.error = new TypeError('Number of repetitions must be a number')
  }
  if (!existInBase(`${strNumber}`, 2)) {
    response.isCorrect = false
    response.error = new Error('Number does not exist in base 2')
  }
  return response
}
