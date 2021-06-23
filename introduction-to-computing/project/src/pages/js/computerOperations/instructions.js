import { existInBase } from "../changeBase/validateNumber.js";

class Opcode {
  constructor(instruction) {
    this.verify(instruction)
    this.code = instruction.slice(0,1);
  }

  verify (instruction) {
    if (typeof instruction !== 'string') throw new TypeError('Instruction must be type string')
    if (!existInBase(instruction, 16)) throw new Error('Instruction must be a binary number')
    if (instruction.length !== 4) throw new Error('Length of the instruction must be 4 bits')
  }

}

class HALT extends Opcode {
  constructor(instruction) {
    super(instruction)
  }
}

class LOAD extends Opcode {
  constructor(Rd, Ms) {
    super(1);
    this.Rd = Rd
    this.Ms = Ms
  }
}

class STORE extends Opcode {
  constructor(Md, Rs) {
    super(2);
    this.Md = Md
    this.Rs = Rs
  }
}

const instruction = {
  HALT: {
    code: 0
  },
  LOAD: {
    code: 1,
    Rd: null,
    Ms: null,
  },
  STORE: {
    code: 2,
    Md: null,
    Rs: null
  },
  ADDI: {
    code: 3,
    Rd: null,
    Rs1: null,
    Rs2: null
  },
  ADDF: {
    code: 4,
    Rd: null,
    Rs1: null,
    Rs2: null
  },
  MOVE: {
    code: 5,
    Rd: null,
    Rs: null
  },
  NOT: {
    code: 6,
    Rd: null,
    Rs: null
  },
  AND: {
    code: 7,
    Rd: null,
    Rs1: null,
    Rs2: null
  },
  OR: {
    code: 8,
    Rd: null,
    Rs1: null,
    Rs2: null
  },
  XOR: {
    code: 9,
    Rd: null,
    Rs1: null,
    Rs2: null
  },
  INC: {
    code: 0xA,
    R: null
  },
  DEC: {
    code: 0xB,
    R: null
  },
  ROTATE: {
    code: 0xC,
    R: null,
    bit: null
  },
  JUMP: {
    code: 0xD,
    R: null,
    n: null
  }
}

export default instruction