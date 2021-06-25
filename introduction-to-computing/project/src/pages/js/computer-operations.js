import { hexByteToBin } from './computerOperations/byteFuffer.js'
import { ADDI, HALT, LOAD, STORE } from './computerOperations/instructions.js'

const memory = []
let i = 0

const instructions = [
  new LOAD('040'),
  new LOAD('141'),
  new ADDI('201'),
  new STORE('422'),
  new HALT('000')
]
memory[instructions[2].operand.Rs]
console.log(instructions)
