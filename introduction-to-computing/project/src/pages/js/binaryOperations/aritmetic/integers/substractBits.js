import addBits from './addBits.js'
import { complementToTwo } from '../../complement/encodeComplement.js'
import anyToDecimal from '../../../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import firstDigit from '../../../changeBase/firstDigit.js'
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

const validateResult = (firstNumber, secondNumber, res, operation) => {
  firstNumber = ValidateComplement2(firstNumber)
  const singFN = firstDigit(firstNumber).asText === '0' ? '' : '-'
  secondNumber = ValidateComplement2(secondNumber)
  const singSN = firstDigit(secondNumber).asText === '0' ? '' : '-'
  res = ValidateComplement2(res)
  const singRes = firstDigit(res).asText === '0' ? '' : '-'

  const DecimalFN = anyToDecimal(2, firstNumber.slice(1)).number
  const DecimalSN = anyToDecimal(2, secondNumber.slice(1)).number
  const DecimalRes = anyToDecimal(2, res.slice(1)).number

  return {
    PrimerNumero: `${singFN}${DecimalFN}`,
    SegundoNumero: `${singSN}${DecimalSN}`,
    Resultado: `${singRes}${DecimalRes}`
  }
}

const ValidateComplement2 = strNumber => {
  let complement

  complement = complementToTwo({ number: strNumber, base: 2, includeSignBit: true }).number

  return complement
}

export default substractBits
