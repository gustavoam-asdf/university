import addBits from './binaryOperations/aritmetic/integers/addBits.js'
import { hexByteToBin } from './computerOperations/byteFuffer.js'
import { ADDI, HALT, Instruction, LOAD, STORE } from './computerOperations/instructions.js'
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
    if (procedure instanceof LOAD) {
      const { dec: operand } = procedure.operand
      console.log('LOAD')
      registers[operand.Rd] = memory[operand.Ms]
    } else if (procedure instanceof ADDI) {
      const { dec: operand } = procedure.operand
      registers[operand.Rd] = addBits({
        firstNumber: registers[operand.Rs1],
        secondNumber: registers[operand.Rs2]
      })
      console.log('ADDI')
    } else if (procedure instanceof STORE) {
      const { dec: operand } = procedure.operand
      memory[operand.Md] = registers[operand.Rs]
      console.log('STORE')
    }
  } else if (procedure) {
    console.log(procedure)
  }
  debugger
}

console.log(registers)
console.log(memory)
