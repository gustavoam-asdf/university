import anyToDecimal from '../../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import firstDigit from '../../changeBase/firstDigit.js'

const Disestructure = (bias, number) => {
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

const ExcessToDecimal = (bias, number) => {
  if (typeof bias !== 'number') throw new TypeError('Bias must be a number')
  if (bias !== 127 && bias !== 1023) throw new Error('Invalid, bias must be 127 or 1023')
  let exponent
  if (bias === 127) {
    exponent = anyToDecimal(2, Disestructure(bias, number).shift).unsignedNumber // string
    exponent = exponent - bias
  } else {
    exponent = anyToDecimal(2, Disestructure(bias, number).shift).unsignedNumber // string
    exponent = exponent - bias
  }

  const sign = Disestructure(bias, number).sign // + o - en string
  const mantissa = Disestructure(bias, number).mantissa //string

  let res = `1.${mantissa}`
  res = res.replace('.', '')
  let res1 = res.slice(0, exponent + 1)
  let res2 = res.slice(exponent + 1)
  res = res1.concat('.', res2)

  let numeroDecimal = anyToDecimal(2, res).number
  numeroDecimal = sign.concat('', numeroDecimal)

  return numeroDecimal
}

export default ExcessToDecimal
