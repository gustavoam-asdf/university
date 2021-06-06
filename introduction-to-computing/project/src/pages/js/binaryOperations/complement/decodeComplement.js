import anyToDecimal from '../../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import { existInBase } from '../../changeBase/validateNumber.js'
import substractBits from '../aritmetic/integers/substractBits.js'
import { complementToOne } from './encodeComplement.js'

export const complementOneToDecimal = ({ number }) => {
  if (typeof number !== 'string') throw new TypeError('Number must be a number type string')
  if (!existInBase(number, 2)) throw new Error('Number number does not exist in base 2')

  const signBit = number.slice(0, 1)

  if (signBit === '0') return anyToDecimal(2, number).unsignedNumber

  const complementOne = complementToOne({ number, base: 2, force: true }).number

  return `-${anyToDecimal(2, complementOne).unsignedNumber}`
}

export const complementTwoToDecimal = ({ number }) => {
  if (typeof number !== 'string') throw new TypeError('Number must be a number type string')
  if (!existInBase(number, 2)) throw new Error('Number number does not exist in base 2')

  const signBit = number.slice(0, 1)

  if (signBit === '0') return anyToDecimal(2, number).unsignedNumber

  const numberMinusOne = substractBits({ firstNumber: number, secondNumber: '1' })
  const complementOne = complementToOne({ number: numberMinusOne, base: 2, force: true }).number

  return `-${anyToDecimal(2, complementOne).unsignedNumber}`
}
