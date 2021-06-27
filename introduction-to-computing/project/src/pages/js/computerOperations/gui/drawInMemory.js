import { Instruction } from '../instructions.js'
import { binToHex, decToHex } from '../simpleChangeBase.js'
import { insertMemoryRow } from './insertRow.js'

/**
 * @param {String} content
 * @param {Number} position
 * @param {Instruction} instruction
 */
const drawInMemory = ($memory, memory, position, instruction) => {
  memory[position] = instruction
  if (instruction instanceof Instruction) {
    insertMemoryRow($memory, instruction.hexByteBuffer, position)
  } else {
    insertMemoryRow(
      $memory,
      `${'0'.repeat(4 - binToHex(instruction).length)}${binToHex(instruction)}`,
      position
    )
  }
}

export default drawInMemory
