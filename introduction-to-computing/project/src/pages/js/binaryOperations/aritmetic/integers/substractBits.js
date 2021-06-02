import addBits from "./addBits.js"
import { complementToTwo } from '../../complement/encodeComplement.js'
import anyToDecimal from '../../../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import firstDigit from '../../../changeBase/firstDigit.js'

const RestofBits = (firstnumber, secondnumber, operation) => {
    let res = 0

    firstnumber = firstnumber.toString()
    secondnumber = secondnumber.toString()

    if (operation == '+') {

        res = addBits(firstnumber, secondnumber)
        console.log(validateResult(firstnumber, secondnumber, res, operation))

    } else if (operation == '-') {

        res = addBits(firstnumber, complementToTwo({ number: secondnumber , base: 2}).number)

    }

    return res
}

const validateResult = (firstnumber, secondnumber, res, operation) => {
    firstnumber = ValidateComplement2(firstnumber)
    const singFN = (firstDigit(firstnumber).asText === '0') ? '' : '-'
    secondnumber = ValidateComplement2(secondnumber)
    const singSN = (firstDigit(secondnumber).asText === '0') ? '' : '-'
    res = ValidateComplement2(res)
    const singRes = (firstDigit(res).asText === '0') ? '' : '-'

    const DecimalFN = anyToDecimal(2, firstnumber.slice(1)).number
    const DecimalSN = anyToDecimal(2, secondnumber.slice(1)).number
    const DecimalRes = anyToDecimal(2, res.slice(1)).number
    const overflow = (DecimalFN + DecimalSN == DecimalRes) ? false : true
    
    return {
        PrimerNumero: `${singFN}${DecimalFN}`,
        SegundoNumero: `${singSN}${DecimalSN}`,
        Resultado: `${singRes}${DecimalRes}`,
        Overflow: overflow,
    }
}

const ValidateComplement2 = (strNumber) => {
    const digit = firstDigit(strNumber)
    let complement
    
    if (digit.asText == '0') {
        complement = complementToTwo({ number: strNumber , base: 2, includeSignBit: true}).number
    } else {
        complement = complementToTwo({ number: strNumber, base: 2, includeSignBit: true }).number
    }
    return complement
}

export default RestofBits

