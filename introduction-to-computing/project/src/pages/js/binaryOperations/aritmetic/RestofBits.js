import addBits from "./addBits.js"
import { complementToTwo } from '../complement/encodeComplement.js'

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



