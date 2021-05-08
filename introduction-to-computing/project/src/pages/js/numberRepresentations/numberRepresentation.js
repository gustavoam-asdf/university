import decimalToAny from '../changeBase/decimalBaseToAnyBase/decimalToAny.js'
import anyToDecimal from '../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import firstDigit from '../changeBase/firstDigit.js'
import { isInteger } from '../changeBase/validateNumber.js'
import completeWithZeros from './completeWithZeros.js'

const decimalToBinary = (strNumber, precision = 100) => decimalToAny(2, strNumber, precision)

const firstDigitIsZero = strNumber => firstDigit(strNumber).asNumber === 0

const shiftPoint = strNumber => {
  if (typeof strNumber !== 'string') throw new TypeError('Number must be a number type string')
  if (isInteger(strNumber)) return { shifted: strNumber.length - 1, decimals: strNumber.slice(1) }
  const pointPosition = strNumber.indexOf('.')

  if (firstDigitIsZero(strNumber)) {
    const firstOnePosition = strNumber.search(/1/)
    return { shifted: 1 - firstOnePosition, decimals: strNumber.slice(firstOnePosition + 1) }
  }

  return { shifted: pointPosition - 1, decimals: strNumber.slice(pointPosition + 1) }
}

const normalize = ({ unsignedNumber }) => {
  if (typeof unsignedNumber !== 'string')
    throw new TypeError('Argument must be a number type string')
  const { shifted, decimals } = shiftPoint(unsignedNumber)
  return {
    exponent: shifted,
    mantissa: decimals
  }
}

const excess = (shift, number) => {
  if (typeof shift !== 'number') throw new TypeError('Shift must be a number')
  if (shift !== 127 && shift !== 1023) throw new Error('Invalid, shift must be 127 or 1023')
  let exponentLength
  let mantissaLength
  if (shift === 127) {
    exponentLength = 8
    mantissaLength = 23
  } else {
    exponentLength = 11
    mantissaLength = 52
  }
  const binaryNumber = decimalToBinary(number)
  const { exponent, mantissa } = normalize(binaryNumber)
  return {
    sign: binaryNumber.sign,
    exponent: completeWithZeros(decimalToBinary(exponent + shift), exponentLength),
    mantissa: completeWithZeros({ unsignedNumber: mantissa }, mantissaLength, 'right', true)
  }
}

const Disestructure = (bias, number) => {
  const digit = firstDigit(number.toString())
  const sign = (digit.asNumber == 1) ? "-" : ""
  const restonumber = number.slice(1)
  let shift = 0, mantissa = 0
  if(bias == 127){
    shift = restonumber.slice(0, 8)
    mantissa = restonumber.slice(8)
  } else if (bias == 1023) {
    shift = restonumber.slice(0, 11)
    mantissa = restonumber.slice(11)
  }
  return {
    sign: sign,
    // number: number,
    // restofnumber: restonumber,
    shift: shift,
    mantissa: mantissa
  }
}

const ExcessToDecimal = (bias, number) => {
  if (typeof bias !== 'number') throw new TypeError('Bias must be a number')
  if (bias !== 127 && bias !== 1023) throw new Error('Invalid, bias must be 127 or 1023')
  let exponentLength
  let mantissaLength
  let exponent
  if (bias === 127) {
    exponent = anyToDecimal(2, Disestructure(bias, number).shift).integer // string
    exponent = exponent - bias
  } else {
    exponent = anyToDecimal(2, Disestructure(bias, number).shift).integer // string
    exponent = exponent - bias
  }

  const sign = Disestructure(bias, number).sign // + o - en string
  const mantissa = Disestructure(bias, number).mantissa //string

  let res = `1.${mantissa}`
  res = res.replace('.', '')
  let res1 = res.slice(0, exponent+1)
  let res2 = res.slice(exponent + 1)
  res = res1.concat(".", res2)

  let numeroDecimal = anyToDecimal(2, res).number
  numeroDecimal = sign.concat("", numeroDecimal)


  return {
    signo: sign,
    exponente: exponent,
    mantissa: mantissa,
    numerodecimal: numeroDecimal
  }
}

// console.log(excess(1023, 0.0025))
// console.log(excess(1023, -0.0025))
// console.log(excess(1023, 0.0625))
// console.log(excess(1023, -0.0625))
// console.log(excess(1023, 0.625))
// console.log(excess(1023, -1.225))
// console.log(excess(1023, 25))
console.log(ExcessToDecimal(127, "11001010000000000111000100001111"))
