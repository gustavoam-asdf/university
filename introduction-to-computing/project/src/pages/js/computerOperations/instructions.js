import { binByteToHex, hexByteToBin, verifyByteBuffer } from './byteFuffer.js'
import { binToDec } from './simpleChangeBase.js'
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
