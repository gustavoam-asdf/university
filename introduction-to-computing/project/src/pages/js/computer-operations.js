import { hexByteToBin } from './computerOperations/byteFuffer.js'
import { ADDI, AND, HALT, Instruction, LOAD, STORE } from './computerOperations/instructions.js'
import { binToDec, hexToDec } from './computerOperations/simpleChangeBase.js'

const instructions = [
  new LOAD('040'),
  new LOAD('141'),
  new ADDI('201'),
  new STORE('422'),
  new HALT('000')
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
