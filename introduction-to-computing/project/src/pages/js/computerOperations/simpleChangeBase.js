import anyToDecimal from '../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import decimalToAny from '../changeBase/decimalBaseToAnyBase/decimalToAny.js'

const binToDec = strNumber => anyToDecimal(2, strNumber).number
const decToBin = strNumber => decimalToAny(2, strNumber).number
const hexToBin = strNumber => decimalToAny(2, anyToDecimal(16, strNumber).number).number
const binToHex = strNumber => decimalToAny(16, anyToDecimal(2, strNumber).number).number
const decToHex = strNumber => decimalToAny(16, strNumber).number
const hexToDec = strNumber => anyToDecimal(16, strNumber).number

export { binToDec, decToBin, hexToBin, binToHex, decToHex, hexToDec }
