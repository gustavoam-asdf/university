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
  return {
    sign,
    shift,
    mantissa
  }
}

const BuildNumber = (sign, mantissa, exp) => {
  let completeform = `1.${mantissa}`

  if (exp > 0) {
    if (completeform.indexOf('.') !== -1) {
      completeform = completeform.replace('.', '')
    }
    let part1 = completeform.slice(0, exp + 1)
    let part2 = completeform.slice(exp + 1)

    completeform = part1.concat('.', part2)
  } else if (exp < 0) {
    if (completeform.indexOf('.') !== -1) {
      completeform = completeform.replace('.', '')
    }
    let part1 = '0'
    let part2 = completeform
    let exptemp = exp * -1

    for (let index = 0; index < exptemp - 1; index++) {
      part2 = `0${part2}`
    }
    
    completeform = part1.concat('.', part2)
  } else if (exp == 0) {
    completeform = completeform
  }

  let Decimalnumber = anyToDecimal(2, completeform).unsignedNumber
  Decimalnumber = sign.concat('', Decimalnumber)

  return Decimalnumber
}

/**
 * @param {String} number
 * @returns {String}
 */

const ExcessToDecimal = (bias, number) => {
  if (typeof bias !== 'number') throw new TypeError('Bias must be a number')
  if (bias !== 127 && bias !== 1023) throw new Error('Invalid, bias must be 127 or 1023')
  const length = number.slice(1).split("")
  let cont = 0
  console.log(length)

  length.forEach(element => {
    if (element == "0") {
      cont++
    }
  })

  if(cont == 31 || cont == 63) return 0

  let exponent = 0
  if (bias === 127) {
    if (number.split('').length == 32) {
      exponent = anyToDecimal(2, Deconstruct(bias, number).shift).unsignedNumber // string
      exponent = exponent - bias
    } else {
      throw new Error('Invalid, excess must have 32 digits')
    }
  } else if (bias === 1023) {
    if (number.split('').length == 64) {
      exponent = anyToDecimal(2, Deconstruct(bias, number).shift).unsignedNumber // string
      exponent = exponent - bias
    } else {
      throw new Error('Invalid, excess must have 64 digits')
    }
  }

  const sign = Deconstruct(bias, number).sign
  const mantissa = Deconstruct(bias, number).mantissa
  const numeroDecimal = BuildNumber(sign, mantissa, exponent)

  return numeroDecimal
}

export default ExcessToDecimal
