import addBits from './addBits.js'
import { complementToTwo } from '../../complement/encodeComplement.js'
import anyToDecimal from '../../../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import firstDigit from '../../../changeBase/firstDigit.js'

const RestofBits = (firstnumber, secondnumber, operation) => {
  let res = 0
  let overflow = false
  let error = ''

  firstnumber = firstnumber.toString()
  secondnumber = secondnumber.toString()

  if (operation == '+') {
    res = addBits(firstnumber, secondnumber)
    const validation = validateResult(firstnumber, secondnumber, res, operation)

    overflow =
      Number(validation.PrimerNumero) + Number(validation.SegundoNumero) ==
      Number(validation.Resultado)
        ? false
        : true

    if (overflow) {
      error = 'En este ejercicio surgió un overflow'
    }
  } else if (operation == '-') {
    res = addBits(firstnumber, complementToTwo({ number: secondnumber, base: 2 }).number)
    const validation = validateResult(
      firstnumber,
      complementToTwo({ number: secondnumber, base: 2 }).number,
      res,
      operation
    )
    overflow =
      Number(validation.PrimerNumero) + Number(validation.SegundoNumero) ==
      Number(validation.Resultado)
        ? false
        : true

    if (overflow) {
      error = 'En este ejercicio surgió un overflow'
    }
  }

  return {
    ResultadoReal: res,
    Overflow: overflow,
    Error: error
  }
}

const validateResult = (firstnumber, secondnumber, res, operation) => {
  firstnumber = ValidateComplement2(firstnumber)
  const singFN = firstDigit(firstnumber).asText === '0' ? '' : '-'
  secondnumber = ValidateComplement2(secondnumber)
  const singSN = firstDigit(secondnumber).asText === '0' ? '' : '-'
  res = ValidateComplement2(res)
  const singRes = firstDigit(res).asText === '0' ? '' : '-'

  const DecimalFN = anyToDecimal(2, firstnumber.slice(1)).number
  const DecimalSN = anyToDecimal(2, secondnumber.slice(1)).number
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

export default RestofBits
