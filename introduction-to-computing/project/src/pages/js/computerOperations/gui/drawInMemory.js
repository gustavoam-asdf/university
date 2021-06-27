import { Instruction } from '../instructions.js'
import { binToHex, decToHex } from '../simpleChangeBase.js'
import zerosLeftTo from '../zerosLeftTo.js'
import { insertMemoryRow } from './insertRow.js'

/**
 * @param {String} content
 * @param {Number} position
 * @param {Instruction} instruction
 */
const chargeInMemory = ($memory, memory, position, instruction) => {
  memory[position] = instruction
  if (instruction instanceof Instruction) {
    insertMemoryRow($memory, instruction.hexByteBuffer, position)
  } else {
    insertMemoryRow($memory, zerosLeftTo(4, binToHex(instruction)), position)
  }
}

export default chargeInMemory
