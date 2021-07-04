import { existInBase } from '../../../changeBase/validateNumber.js'
import matchLengths from '../../matchLengths.js'

const addBits = ({ firstNumber, secondNumber, expand = false }) => {
  if (typeof firstNumber !== 'string')
    throw new TypeError('First number must be a number type string')
  if (typeof secondNumber !== 'string')
    throw new TypeError('Second number must be a number type string')
  if (!existInBase(firstNumber, 2)) throw new Error('First number does not exist in base 2')
  if (!existInBase(secondNumber, 2)) throw new Error('Second number does not exist in base 2')

  const numbers = matchLengths({ firstNumber, secondNumber })

  let carry = 0

  const result = [...numbers.firstNumber]
    .map((bit, i, self) => {
      const lastBit = {
        first: self[self.length - i - 1],
        second: [...numbers.secondNumber][self.length - i - 1]
      }
      const xor = lastBit.first ^ lastBit.second ^ carry
      carry =
        (lastBit.first === '1' && lastBit.second === '1') ||
        (carry === 1 && (lastBit.first === '1' || lastBit.second === '1'))
          ? 1
          : 0

      return xor
    })
    .reverse()
    .join('')

  if (expand) return carry === 0 ? result : `1${result}`
  return result
}

export default addBits
