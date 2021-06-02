import anyToDecimal from '../../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import decimalToAny from '../../changeBase/decimalBaseToAnyBase/decimalToAny.js'
import { isHex } from '../../changeBase/validateNumber.js'
import completeWithZeros from '../../numberRepresentations/completeWithZeros.js'
import findNearestLenght from '../../numberRepresentations/findNearestLenght.js'
import addBits from '../aritmetic/integers/addBits.js'

export const complementToOne = ({ number: strNumber, base, includeSignBit = false }) => {
  if (typeof strNumber !== 'string') throw new TypeError('Number must be a number type string')
  if (typeof base !== 'number') throw new TypeError('Base must be a number')
  if (!isHex(strNumber)) throw new Error('Number does not exist')

  if (base !== 2) {
    const decimalNumber = anyToDecimal(base, strNumber)
    const binaryNumber = decimalToAny(2, decimalNumber.unsignedNumber)
    const bits = findNearestLenght(binaryNumber.unsignedNumber.length + 1, 2)
    const completeNumber = completeWithZeros(binaryNumber, bits)
    if (decimalNumber.sign === '0') {
      return { type: 'c1', number: completeNumber, sign: '0' }
    }
    const invertedBits = [...completeNumber].map(bit => (bit === '1' ? '0' : '1')).join('')
    return { type: 'c1', number: invertedBits, sign: '1' }
  }

  if ([...strNumber].every(bit => bit === '0')) {
    return { type: 'c1', number: '0', sign: '0' }
  }

  const invertedBits = [...strNumber].map(bit => (bit === '1' ? '0' : '1')).join('')
  const firstBit = strNumber.slice(0, 1)
  if (includeSignBit) {
    if (firstBit === '0') {
      return { type: 'c1', number: strNumber, sign: '0' }
    }
    return { type: 'c1', number: `${firstBit}${invertedBits.slice(1)}`, sign: '1' }
  }
  return { type: 'c1', number: invertedBits }
}

export const complementToTwo = ({ number: strNumber, base, includeSignBit = false }) => {
  if (typeof strNumber !== 'string') throw new TypeError('Number must be a number type string')
  if (typeof base !== 'number') throw new TypeError('Base must be a number')
  if (!isHex(strNumber)) throw new Error('Number does not exist')

  const numberInC1 = complementToOne({ number: strNumber, base, includeSignBit })
  if (numberInC1.sign === '0') {
    return { type: 'c2', number: numberInC1.number }
  }
  return { type: 'c2', number: addBits(numberInC1.number, '1') }
}
