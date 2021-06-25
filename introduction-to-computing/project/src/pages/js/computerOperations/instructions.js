import anyToDecimal from '../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import decimalToAny from '../changeBase/decimalBaseToAnyBase/decimalToAny.js'
import { existInBase } from '../changeBase/validateNumber.js'
import completeWithZeros from '../numberRepresentations/completeWithZeros.js'

const hexToBin = strNumber => decimalToAny(2, anyToDecimal(16, strNumber).number).number
const binToHex = strNumber => decimalToAny(16, anyToDecimal(2, strNumber).number).number
export class Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    const verifier = this.verifyByteBuffer(byteBuffer)
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
    return Instruction.binByteToHex(this.binByteBuffer)
  }

  verifyByteBuffer(byteBuffer) {
    if (typeof byteBuffer !== 'string')
      return { ok: false, error: new TypeError('Byte buffer must be type string') }
    if (!existInBase(byteBuffer, 2))
      return { ok: false, error: new Error('Byte buffer must be a binary number') }
    if (byteBuffer.length !== 16)
      return { ok: false, error: new Error('Length of the Byte buffer must be 16 bits') }

    return { ok: true, error: undefined }
  }

  static hexByteToBin(byteBuffer) {
    if (typeof byteBuffer !== 'string') throw new TypeError('Byte buffer must be type string')
    if (!existInBase(byteBuffer, 16)) throw new Error('Byte buffer must be a hexadecimal number')

    return [...byteBuffer].reduce((acc, byte) => {
      return (acc += completeWithZeros({ unsignedNumber: hexToBin(byte) }, 4))
    }, '')
  }

  static binByteToHex(byteBuffer) {
    if (typeof byteBuffer !== 'string') throw new TypeError('Byte buffer must be type string')
    if (!existInBase(byteBuffer, 2)) throw new Error('Byte buffer must be a binary number')
    if (byteBuffer.length % 4 !== 0)
      throw new Error('Length of byte buffer must be a multiple of 4')

    const bytes = byteBuffer.replace(/([01]{4})(\B)/g, '$1 ').split(' ')

    return bytes.reduce((acc, byte) => {
      return (acc += binToHex(byte))
    }, '')
  }
}

export class HALT extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`0000${byteBuffer}`)
    this.operand = undefined
  }
}

export class LOAD extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`0001${byteBuffer}`)
    this.operand = {
      Rd: this.d2,
      Ms: `${this.d3}${this.d4}`
    }
  }
}

export class STORE extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`0010${byteBuffer}`)
    this.operand = {
      Md: `${this.d2}${this.d3}`,
      Rs: this.d4
    }
  }
}

export class ADDI extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`0011${byteBuffer}`)
    this.operand = {
      Rd: this.d2,
      Rs1: this.d3,
      Rs2: this.d4
    }
  }
}

export class ADDF extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`0100${byteBuffer}`)
    this.operand = {
      Rd: this.d2,
      Rs1: this.d3,
      Rs2: this.d4
    }
  }
}

export class MOVE extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`0101${byteBuffer}`)
    this.operand = {
      Rd: this.d2,
      Rs: this.d3
    }
  }
}

export class NOT extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`0110${byteBuffer}`)
    this.operand = {
      Rd: this.d2,
      Rs: this.d3
    }
  }
}

export class AND extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`0111${byteBuffer}`)
    this.operand = {
      Rd: this.d2,
      Rs1: this.d3,
      Rs2: this.d4
    }
  }
}

export class OR extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`1000${byteBuffer}`)
    this.operand = {
      Rd: this.d2,
      Rs1: this.d3,
      Rs2: this.d4
    }
  }
}

export class XOR extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`1001${byteBuffer}`)
    this.operand = {
      Rd: this.d2,
      Rs1: this.d3,
      Rs2: this.d4
    }
  }
}

export class INC extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`1010${byteBuffer}`)
    this.operand = {
      Rd: this.d2
    }
  }
}

export class DEC extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`1011${byteBuffer}`)
    this.operand = {
      Rd: this.d2
    }
  }
}

export class ROTATE extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`1100${byteBuffer}`)
    this.operand = {
      Rd: this.d2,
      n: this.d3,
      zeroOrOne: this.d4
    }
  }
}

export class JUMP extends Instruction {
  /**
   * @param {String} byteBuffer
   */
  constructor(byteBuffer) {
    super(`1101${byteBuffer}`)
    this.operand = {
      Rd: this.d2,
      n: `${this.d3}${this.d4}`
    }
  }
}
