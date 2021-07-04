import applyEventsForm from '../../js/formHandler/applyEventsForm.js'
import {
  clearForm,
  drawInputInfo,
  showFormErrorMessage,
  showFormSuccessMessage
} from '../../js/formHandler/drawInfo.js'
import { isNumber } from './changeBase/validateNumber.js'
import { binByteToHex, hexByteToBin } from './computerOperations/byteFuffer.js'
import chargeInMemory from './computerOperations/gui/drawInMemory.js'
import { insertMemoryRow, insertRegisterRow } from './computerOperations/gui/insertRow.js'
import {
  ADDI,
  AND,
  HALT,
  Instruction,
  LOAD,
  NOT,
  OR,
  STORE,
  XOR
} from './computerOperations/instructions.js'
import { binToDec, decToHex } from './computerOperations/simpleChangeBase.js'
import zerosLeftTo from './computerOperations/zerosLeftTo.js'

const $form = document.getElementById('computer-operations__form')
const $numberOne = document.getElementById('number-one')
const $numberTwo = document.getElementById('number-two')
const $operation = document.getElementById('operations')
const $memory = document.getElementById('memory')
const $registers = document.getElementById('registers')
const $result = document.getElementById('result')
const $pc = document.getElementById('pc')
const $ir = document.getElementById('ir')
const $alu = {
  self: document.getElementById('alu'),
  draw(numberOne, operator, numberTwo) {
    this.self.innerHTML = `
      <div class="number-one">${numberOne}</div>
      <div class="operator">${operator}</div>
      <div class="number-two">${numberTwo}</div>
    `
  },

  clear() {
    this.self.innerHTML = ''
  }
}
const memory = []
const registers = []
const timeInterval = 2000
let isOccuped = false
const createInstruction = (strInstruction, value) => {
  if (strInstruction === 'ADDI') return new ADDI(value)
  else if (strInstruction === 'NOT') return new NOT(value)
  else if (strInstruction === 'AND') return new AND(value)
  else if (strInstruction === 'OR') return new OR(value)
  else if (strInstruction === 'XOR') return new XOR(value)
  else {
    throw new Error('Invalid instruction')
  }
}

$operation.addEventListener(
  'focus',
  () => {
    $operation.firstElementChild.remove()
    verifier.operator = true
  },
  {
    once: true
  }
)

const verifier = {
  numberOne: false,
  numberTwo: false,
  operator: false
}

const inputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  if (inputPressed.disabled) return
  const value = inputPressed.value
  if (inputPressed.name === 'number-one') {
    verifier.numberOne = drawInputInfo(isNumber(value) && Number(value) >= 0, inputPressed)
  } else if (inputPressed.name === 'number-two') {
    verifier.numberTwo = drawInputInfo(isNumber(value) && Number(value) >= 0, inputPressed)
  }
}

applyEventsForm($form, inputEventHandler)

const iData = 64,
  iInstructions = 0,
  iRegister = 0

let iD = 0,
  iI = 0,
  iR = 0

const blockOfInstructions = (strInstruction, { firstNumber, secondNumber }) => {
  if (strInstruction === 'NOT') return
  $result.value = ''
  const iDec = {
    m: {
      first: iData + iD++,
      second: iData + iD++
    },
    r: {
      first: iRegister + iR++,
      second: iRegister + iR++,
      result: iRegister + iR++
    }
  }
  const iHex = {
    m: {
      first: decToHex(`${iDec.m.first}`),
      second: decToHex(`${iDec.m.second}`)
    },
    r: {
      first: decToHex(`${iDec.r.first}`),
      second: decToHex(`${iDec.r.second}`),
      result: decToHex(`${iDec.r.result}`)
    }
  }
  const hexNumber = {
    first: zerosLeftTo(4, decToHex(firstNumber)),
    second: zerosLeftTo(4, decToHex(secondNumber))
  }

  const drawInMemory = (position, instruction) =>
    chargeInMemory($memory, memory, position, instruction)

  drawInMemory(iInstructions + iI++, new LOAD(`${iHex.r.first}${iHex.m.first}`))
  drawInMemory(iInstructions + iI++, new LOAD(`${iHex.r.second}${iHex.m.second}`))
  drawInMemory(
    iInstructions + iI++,
    createInstruction(strInstruction, `${iHex.r.result}${iHex.r.first}${iHex.r.second}`)
  )
  drawInMemory(iInstructions + iI++, new STORE(`${decToHex(`${iData + iD++}`)}${iHex.r.result}`))
  drawInMemory(iInstructions + iI++, new HALT(`000`))
  drawInMemory(iDec.m.first, hexByteToBin(hexNumber.first))
  drawInMemory(iDec.m.second, hexByteToBin(hexNumber.second))
  return {
    position: iDec.r.result,
    ...hexNumber
  }
}

let g = -1
$form.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('form__message')
  const successMessage = document.getElementById('form__success-message')
  if (!(verifier.numberOne && verifier.numberTwo && verifier.operator)) {
    successMessage.classList.remove('form__message-active')
    showFormErrorMessage(errorMessage, 'Por favor rellena el formulario correctamente', 4)
    return
  }
  if (isOccuped) {
    console.log(successMessage)
    successMessage.classList.remove('form__message-active')
    showFormErrorMessage(errorMessage, 'Se está ejecutando otra operación por favor espere', 4)
    return
  }
  isOccuped = true

  $alu.clear()
  try {
    const result = blockOfInstructions($operation.value, {
      firstNumber: $numberOne.value,
      secondNumber: $numberTwo.value
    })

    const instructions = memory.filter(
      procedure => procedure instanceof Instruction && !procedure.used
    )
    let i = -1
    let interval = setInterval(() => {
      i++
      g++
      const procedure = instructions[i]
      $pc.innerText = zerosLeftTo(2, decToHex(`${g}`))
      $ir.innerText = procedure.hexByteBuffer
      if (['ADDI', 'OR', 'AND', 'XOR'].includes(procedure.constructor.name)) {
        $alu.draw(result.first, procedure.constructor.name, result.second)
      }
      const op = procedure.action({ memory, registers })
      if (op?.Rd) {
        insertRegisterRow($registers, binByteToHex(registers[op.Rd]), op.Rd)
      }
      if (op?.Md) {
        insertMemoryRow($memory, binByteToHex(memory[op.Md]), op.Md)
      }
      if (i === instructions.length - 1) {
        clearInterval(interval)
        $result.value = binToDec(registers[result.position])
        isOccuped = false
      }
    }, timeInterval)
  } catch (error) {
    console.log(error)
    successMessage.classList.remove('form__message-active')
    showFormErrorMessage(errorMessage, 'A ocurrido un error', 4)
    return
  }

  showFormSuccessMessage(successMessage, 2)
  clearForm($form)
})
