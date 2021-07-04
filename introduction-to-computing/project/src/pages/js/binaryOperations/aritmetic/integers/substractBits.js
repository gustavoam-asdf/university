import addBits from './addBits.js'
import { complementToTwo } from '../../complement/encodeComplement.js'
import { existInBase } from '../../../changeBase/validateNumber.js'
import matchLengths from '../../matchLengths.js'

const substractBits = ({ firstNumber, secondNumber }) => {
  if (typeof firstNumber !== 'string')
    throw new TypeError('First number must be a number type string')
  if (typeof secondNumber !== 'string')
    throw new TypeError('Second number must be a number type string')
  if (!existInBase(firstNumber, 2)) throw new Error('First number does not exist in base 2')
  if (!existInBase(secondNumber, 2)) throw new Error('Second number does not exist in base 2')

  const numbers = matchLengths({ firstNumber, secondNumber })

  numbers.secondNumber = complementToTwo({
    number: numbers.secondNumber,
    base: 2,
    force: true
  }).number

  return addBits(numbers)
}

export default substractBits
