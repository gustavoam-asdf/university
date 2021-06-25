import { binByteToHex, hexByteToBin, verifyByteBuffer } from './byteFuffer.js'
import { binToDec } from './simpleChangeBase.js'
import addBits from '../binaryOperations/aritmetic/integers/addBits.js'
import matchLengths from '../binaryOperations/matchLengths.js'
import substractBits from '../binaryOperations/aritmetic/integers/substractBits.js'
export class Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    const verifier = verifyByteBuffer({ byteBuffer, base: 2, testLength: byteBuffer.length !== 16 })
    if (!verifier.ok) throw verifier.error
    this.code = byteBuffer.slice(0, 4)
    this.d2 = byteBuffer.slice(4, 8)
    this.d3 = byteBuffer.slice(8, 12)
    this.d4 = byteBuffer.slice(12)
  }

  get binByteBuffer() {
    return `${this.code}${this.d2}${this.d3}${this.d4}`
  }

  get hexByteBuffer() {
    return binByteToHex(this.binByteBuffer)
  }
}

export class HALT extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`0${byteBuffer}`))
    this.operand = undefined
  }

  action() {}
}

export class LOAD extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`1${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2,
        Ms: `${this.d3}${this.d4}`
      },
      dec: {
        Rd: Number(binToDec(this.d2)),
        Ms: Number(binToDec(`${this.d3}${this.d4}`))
      }
    }
  }

  action({ memory, registers }) {
    if (registers[this.operand.dec.Rd]) throw new ReferenceError('Space in registers is occupied')
    registers[this.operand.dec.Rd] = memory[this.operand.dec.Ms]
  }
}

export class STORE extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`2${byteBuffer}`))
    this.operand = {
      bin: {
        Md: `${this.d2}${this.d3}`,
        Rs: this.d4
      },
      dec: {
        Md: Number(binToDec(`${this.d2}${this.d3}`)),
        Rs: Number(binToDec(this.d4))
      }
    }
  }

  action({ memory, registers }) {
    if (memory[this.operand.dec.Md]) throw new ReferenceError('Space in memory is occupied')
    memory[this.operand.dec.Md] = registers[this.operand.dec.Rs]
  }
}

export class ADDI extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`3${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2,
        Rs1: this.d3,
        Rs2: this.d4
      },
      dec: {
        Rd: Number(binToDec(this.d2)),
        Rs1: Number(binToDec(this.d3)),
        Rs2: Number(binToDec(this.d4))
      }
    }
  }

  /**
   * @param {Array} registers
   */
  action({ registers }) {
    if (registers[this.operand.dec.Rd]) throw new ReferenceError('Space in registers is occupied')
    registers[this.operand.dec.Rd] = addBits({
      firstNumber: registers[this.operand.dec.Rs1],
      secondNumber: registers[this.operand.dec.Rs2]
    })
  }
}

export class ADDF extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`4${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2,
        Rs1: this.d3,
        Rs2: this.d4
      },
      dec: {
        Rd: Number(binToDec(this.d2)),
        Rs1: Number(binToDec(this.d3)),
        Rs2: Number(binToDec(this.d4))
      }
    }
  }

  action({ registers }) {
    if (registers[this.operand.dec.Rd]) throw new ReferenceError('Space in registers is occupied')
    registers[this.operand.dec.Rd] = addBits({
      firstNumber: registers[this.operand.dec.Rs1],
      secondNumber: registers[this.operand.dec.Rs2]
    })
  }
}

export class MOVE extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`5${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2,
        Rs: this.d3
      },
      dec: {
        Rd: Number(binToDec(this.d2)),
        Rs: Number(binToDec(this.d3))
      }
    }
  }

  action({ registers }) {
    if (registers[this.operand.dec.Rd]) throw new ReferenceError('Space in registers is occupied')
    registers[this.operand.dec.Rd] = registers[this.operand.dec.Rs]
  }
}

export class NOT extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`6${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2,
        Rs: this.d3
      },
      dec: {
        Rd: Number(binToDec(this.d2)),
        Rs: Number(binToDec(this.d3))
      }
    }
  }

  action({ registers }) {
    if (registers[this.operand.dec.Rd]) throw new ReferenceError('Space in registers is occupied')
    registers[this.operand.dec.Rd] = [...registers[this.operand.dec.Rs]].map(bit =>
      bit === '1' ? '0' : '1'
    )
  }
}

export class AND extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`7${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2,
        Rs1: this.d3,
        Rs2: this.d4
      },
      dec: {
        Rd: Number(binToDec(this.d2)),
        Rs1: Number(binToDec(this.d3)),
        Rs2: Number(binToDec(this.d4))
      }
    }
  }

  action({ registers }) {
    if (registers[this.operand.dec.Rd]) throw new ReferenceError('Space in registers is occupied')
    const numbers = matchLengths({
      firstNumber: registers[this.operand.dec.Rs1],
      secondNumber: registers[this.operand.dec.Rs2]
    })
    registers[this.operand.dec.Rd] = [...numbers.firstNumber]
      .map((bit, i) => bit & [...numbers.secondNumber][i])
      .join('')
  }
}

export class OR extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`8${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2,
        Rs1: this.d3,
        Rs2: this.d4
      },
      dec: {
        Rd: Number(binToDec(this.d2)),
        Rs1: Number(binToDec(this.d3)),
        Rs2: Number(binToDec(this.d4))
      }
    }
  }

  action({ registers }) {
    if (registers[this.operand.dec.Rd]) throw new ReferenceError('Space in registers is occupied')
    const numbers = matchLengths({
      firstNumber: registers[this.operand.dec.Rs1],
      secondNumber: registers[this.operand.dec.Rs2]
    })
    registers[this.operand.dec.Rd] = [...numbers.firstNumber]
      .map((bit, i) => bit | [...numbers.secondNumber][i])
      .join('')
  }
}

export class XOR extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`9${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2,
        Rs1: this.d3,
        Rs2: this.d4
      },
      dec: {
        Rd: Number(binToDec(this.d2)),
        Rs1: Number(binToDec(this.d3)),
        Rs2: Number(binToDec(this.d4))
      }
    }
  }

  action({ registers }) {
    if (registers[this.operand.dec.Rd]) throw new ReferenceError('Space in registers is occupied')
    const numbers = matchLengths({
      firstNumber: registers[this.operand.dec.Rs1],
      secondNumber: registers[this.operand.dec.Rs2]
    })
    registers[this.operand.dec.Rd] = [...numbers.firstNumber]
      .map((bit, i) => bit ^ [...numbers.secondNumber][i])
      .join('')
  }
}

export class INC extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`A${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2
      },
      dec: {
        Rd: Number(binToDec(this.d2))
      }
    }
  }

  action({ registers }) {
    if (!registers[this.operand.dec.Rd])
      throw new ReferenceError('Does not exist a value in register')
    registers[this.operand.dec.Rd] = addBits({
      firstNumber: registers[this.operand.dec.Rd],
      secondNumber: '1'
    })
  }
}

export class DEC extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`B${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2
      },
      dec: {
        Rd: Number(binToDec(this.d2))
      }
    }
  }

  action({ registers }) {
    if (!registers[this.operand.dec.Rd])
      throw new ReferenceError('Does not exist a value in register')
    registers[this.operand.dec.Rd] = substractBits({
      firstNumber: registers[this.operand.dec.Rd],
      secondNumber: '1'
    })
  }
}

export class ROTATE extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`C${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2,
        n: this.d3,
        zeroOrOne: this.d4
      },
      dec: {
        Rd: Number(binToDec(this.d2)),
        n: Number(binToDec(this.d3)),
        zeroOrOne: Number(binToDec(this.d4))
      }
    }
  }
}

export class JUMP extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(hexByteToBin(`D${byteBuffer}`))
    this.operand = {
      bin: {
        Rd: this.d2,
        n: `${this.d3}${this.d4}`
      },
      dec: {
        Rd: Number(binToDec(this.d2)),
        n: Number(binToDec(`${this.d3}${this.d4}`))
      }
    }
  }
}
