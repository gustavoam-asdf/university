import { existInBase } from '../../changeBase/validateNumber.js'
import addBits from '../aritmetic/addBits.js'

export const complementToOne = ({ number: strNumber, includeSignBit = false }) => {
  if (typeof strNumber !== 'string') throw new TypeError('Number must be a number type string')
  if (!existInBase(`${strNumber}`, 2)) throw new Error('Number does not exist in base 2')

  const invertedBits = [...strNumber].flatMap(bit => (bit === '1' ? '0' : '1')).join('')
  const firstBit = strNumber.slice(0, 1)
  if (includeSignBit) return { type: 'c1', number: `${firstBit}${invertedBits.slice(1)}` }
  return { type: 'c1', number: invertedBits }
}

export const complementToTwo = ({ number: strNumber, includeSignBit = false }) => {
  if (typeof strNumber !== 'string') throw new TypeError('Number must be a number type string')
  if (!existInBase(`${strNumber}`, 2)) throw new Error('Number does not exist in base 2')

  const numberInC1 = complementToOne({ number: strNumber, includeSignBit }).number
  return { type: 'c2', number: addBits(numberInC1, '1') }
}
