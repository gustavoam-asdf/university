import addBits from './binaryOperations/aritmetic/integers/addBits.js'
import { HALT, Instruction, LOAD } from './computerOperations/instructions.js'
import process from './computerOperations/process.js'

// 10 & 25
// 0b00001010
// 0b00011001
// '-----------'
// 0b00001000
// '-----------'

// const numberA = {
//   dec: 91,
//   bin: '01011011'
// }
// const numberB = {
//   dec: 45,
//   bin: '00101101'
// }
// const numberC = {
//   dec: 21,
//   bin: '00010101'
// }

// const numberAorC = {
//   dec: numberA.dec | numberC.dec,
//   bin : '01011111'
// }

// let numberD = (numberA.dec | numberC.dec) + numberB.dec

// Number(`0b${numberAorC.bin}`)
// Number(`0b${numberAorC.bin}`) + numberB.dec

// numberD

const instructions = [new LOAD('000001000000'), new LOAD(Instruction.hexByteToBin(`040`))]

console.log(instructions)
