import { hexByteToBin } from './computerOperations/byteFuffer.js'
import { ADDI, AND, HALT, Instruction, LOAD, OR, STORE } from './computerOperations/instructions.js'
import { binToDec, hexToDec } from './computerOperations/simpleChangeBase.js'

const instructions = [
  new LOAD(`040`),
  new LOAD(`141`),
  new OR(`201`),
  new STORE(`422`),
  new HALT(`000`)
]
const memory = [...instructions]
memory[hexToDec('40')] = hexByteToBin('00A1')
memory[hexToDec('41')] = hexByteToBin('00FE')
const registers = []

for (const procedure of memory) {
  if (!procedure) break
  if (procedure instanceof Instruction) {
    procedure.action({ memory, registers })
    console.log(procedure)
  } else if (procedure) {
    console.log(procedure)
  }
}

console.log('')
console.log(registers)
console.log(memory)

// import { hexByteToBin } from './computerOperations/byteFuffer.js'
// import { ADDI, AND, HALT, Instruction, LOAD, OR, STORE } from './computerOperations/instructions.js'
// import { binToDec, decToHex, hexToDec } from './computerOperations/simpleChangeBase.js'

// const iProc = {
//   init: 0,
//   use() {
//     return this.init++
//   }
// }
// const iData = {
//   init: 64,
//   use() {
//     return this.init++
//   }
// }
// const iReg = {
//   init: 0,
//   use() {
//     return this.init++
//   }
// }

// const memory = []

// memory[iProc.use()] = new LOAD(`${decToHex(`${iReg.use()}`)}${decToHex(`${iData.use()}`)}`)
// memory[iProc.use()] = new LOAD(`${decToHex(`${iReg.use()}`)}${decToHex(`${iData.use()}`)}`)
// memory[iProc.use()] = new ADDI(
//   `${decToHex(`${iReg.use()}`)}${decToHex(`${iReg.init - 3}`)}${decToHex(`${iReg.init - 2}`)}`
// )
// memory[iProc.use()] = new STORE(`${decToHex(`${iData.use()}`)}2`)
// memory[iProc.use()] = new HALT(`000`)

// memory[hexToDec('40')] = hexByteToBin('00A1')
// memory[hexToDec('41')] = hexByteToBin('00FE')
// const registers = []

// console.log(memory)
// console.log('')

// for (const procedure of memory) {
//   if (!procedure) break
//   if (procedure instanceof Instruction) {
//     procedure.action({ memory, registers })
//   }
// }

// console.log(registers)
