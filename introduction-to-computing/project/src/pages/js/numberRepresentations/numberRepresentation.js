import encodeToExcess from './ieee754/encodeToExcess.js'

// console.log(encodeToExcess(127, 0.0025))
// console.log(encodeToExcess(127, -0.0025))
// console.log(encodeToExcess(127, 0.0625))
// console.log(encodeToExcess(127, -0.0625))
// console.log(encodeToExcess(127, 0.625))
// console.log(encodeToExcess(127, -1.225))
// console.log(encodeToExcess(127, 25))
console.log(encodeToExcess(127, 10))
console.log(encodeToExcess(1023, 10))

// const Disestructure = (bias, number) => {
//   const digit = firstDigit(number.toString())
//   const sign = digit.asNumber == 1 ? '-' : ''
//   const restonumber = number.slice(1)
//   let shift = 0,
//     mantissa = 0
//   if (bias == 127) {
//     shift = restonumber.slice(0, 8)
//     mantissa = restonumber.slice(8)
//   } else if (bias == 1023) {
//     shift = restonumber.slice(0, 11)
//     mantissa = restonumber.slice(11)
//   }
//   return {
//     sign: sign,
//     // number: number,
//     // restofnumber: restonumber,
//     shift: shift,
//     mantissa: mantissa
//   }
// }

// const ExcessToDecimal = (bias, number) => {
//   if (typeof bias !== 'number') throw new TypeError('Bias must be a number')
//   if (bias !== 127 && bias !== 1023) throw new Error('Invalid, bias must be 127 or 1023')
//   let exponentLength
//   let mantissaLength
//   let exponent
//   if (bias === 127) {
//     exponent = anyToDecimal(2, Disestructure(bias, number).shift).integer // string
//     exponent = exponent - bias
//   } else {
//     exponent = anyToDecimal(2, Disestructure(bias, number).shift).integer // string
//     exponent = exponent - bias
//   }

//   const sign = Disestructure(bias, number).sign // + o - en string
//   const mantissa = Disestructure(bias, number).mantissa //string

//   let res = `1.${mantissa}`
//   res = res.replace('.', '')
//   let res1 = res.slice(0, exponent + 1)
//   let res2 = res.slice(exponent + 1)
//   res = res1.concat('.', res2)

//   let numeroDecimal = anyToDecimal(2, res).number
//   numeroDecimal = sign.concat('', numeroDecimal)

//   return {
//     signo: sign,
//     exponente: exponent,
//     mantissa: mantissa,
//     numerodecimal: numeroDecimal
//   }
// }

// // console.log(excess(1023, 0.0025))
// // console.log(excess(1023, -0.0025))
// // console.log(excess(1023, 0.0625))
// // console.log(excess(1023, -0.0625))
// // console.log(excess(1023, 0.625))
// // console.log(excess(1023, -1.225))
// // console.log(excess(1023, 25))
// console.log(ExcessToDecimal(127, '11001010000000000111000100001111'))
