import anyToDecimal from '../../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import decimalToAny from '../../changeBase/decimalBaseToAnyBase/decimalToAny.js'
import { isHex } from '../../changeBase/validateNumber.js'
import completeWithZeros from '../../numberRepresentations/completeWithZeros.js'
import findNearestLenght from '../../numberRepresentations/findNearestLenght.js'
import addBits from '../aritmetic/integers/addBits.js'
//10010010-->01101101

export const complementToOne = ({ number: strNumber, base, includeSignBit = false }) => {
  if (typeof strNumber !== 'string') throw new TypeError('Number must be a number type string')
  if (typeof base !== 'number') throw new TypeError('Base must be a number')
  if (!isHex(strNumber)) throw new Error('Number does not exist')

  let isPositive = strNumber.slice(0, 1) !== '-'
  let number = strNumber.replace('-', '')
  let recomendedBits = findNearestLenght(strNumber.length, 2)

  if (base !== 2) {
    const decimalNumber = anyToDecimal(base, number)
    const binaryNumber = decimalToAny(2, decimalNumber.unsignedNumber)
    const bits = findNearestLenght(binaryNumber.unsignedNumber.length + 1, 2)
    const completeNumber = completeWithZeros(binaryNumber, bits)

    if (decimalNumber.sign === '0') {
      return { type: 'c1', number: completeNumber, sign: '0' }
    }
    const invertedBits = [...completeNumber].map(bit => (bit === '1' ? '0' : '1')).join('')
    return { type: 'c1', number: invertedBits, sign: '1' }
  }

  const completeNumber = completeWithZeros({ unsignedNumber: number }, recomendedBits)
  const invertedBits = [...completeNumber].map(bit => (bit === '1' ? '0' : '1')).join('')

  if (force) return { number: invertedBits }
  if (isPositive) return { number: completeNumber, sign: '0' }

  return { number: `1${invertedBits.slice(1)}`, sign: '1' }
}

export const complementToTwo = ({ number: strNumber, base, force = false }) => {
  if (typeof strNumber !== 'string') throw new TypeError('Number must be a number type string')
  if (typeof base !== 'number') throw new TypeError('Base must be a number')
  if (!isHex(strNumber)) throw new Error('Number does not exist')

  const numberInC1 = complementToOne({ number: strNumber, base, force })
  if (numberInC1.sign === '0') return { number: numberInC1.number, sign: '0' }

  return {
    number: addBits({ firstNumber: numberInC1.number, secondNumber: '1' }),
    sign: '1'
  }
}
