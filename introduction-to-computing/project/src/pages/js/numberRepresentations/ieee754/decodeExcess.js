import anyToDecimal from '../../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import firstDigit from '../../changeBase/firstDigit.js'

const Deconstruct = (bias, number) => {
  const digit = firstDigit(number.toString())
  const sign = digit.asNumber == 1 ? '-' : ''
  const restonumber = number.slice(1)
  let shift = 0,
    mantissa = 0
  if (bias == 127) {
    shift = restonumber.slice(0, 8)
    mantissa = restonumber.slice(8)
  } else if (bias == 1023) {
    shift = restonumber.slice(0, 11)
    mantissa = restonumber.slice(11)
  }
  return { sign, shift, mantissa }
}

const BuildNumber = (sign, mantissa, exp) => {
  let completeform = `1.${mantissa}`
  if (completeform.indexOf('.') !== -1) {
    completeform = completeform.replace('.', '')
  }
  let part1 = completeform.slice(0, exp + 1)
  let part2 = completeform.slice(exp + 1)

  completeform = part1.concat('.', part2)

  let Decimalnumber = anyToDecimal(2, completeform).number
  Decimalnumber = sign.concat('', Decimalnumber)

  return Decimalnumber
}

export const ExcessToDecimal = (bias, number) => {
  if (typeof bias !== 'number') throw new TypeError('Bias must be a number')
  if (bias !== 127 && bias !== 1023) throw new Error('Invalid, bias must be 127 or 1023')

  let exponent

  if (bias === 127) {
    exponent = anyToDecimal(2, Deconstruct(bias, number).shift).integer
    exponent = exponent - bias
  } else {
    exponent = anyToDecimal(2, Deconstruct(bias, number).shift).integer
    exponent = exponent - bias
  }

  const sign = Deconstruct(bias, number).sign
  const mantissa = Deconstruct(bias, number).mantissa
  const numeroDecimal = BuildNumber(sign, mantissa, exponent)

  return numeroDecimal
}

export default ExcessToDecimal
