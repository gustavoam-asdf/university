import addBits from "./addBits.js"
import { complementToTwo } from '../../complement/encodeComplement.js'
import anyToDecimal from '../../../changeBase/anyBaseToDecimalBase/anyToDecimal.js'

export const RestofBits = (firstnumber, secondnumber, operation) => {
    let res = 0

    firstnumber = firstnumber.toString()
    secondnumber = secondnumber.toString()

    if (operation == '+') {

        res = addBits(firstnumber, secondnumber)

    } else if (operation == '-') {

        res = addBits(firstnumber, complementToTwo({ number: secondnumber }).number)

    }

    return res
}

const validateResult = (firstnumber, secondnumber, operation) => {
    anyToDecimal
} 