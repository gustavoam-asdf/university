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
import { binToDec, binToHex, decToHex, hexToDec } from './computerOperations/simpleChangeBase.js'
import zerosLeftTo from './computerOperations/zerosLeftTo.js'
import completeWithZeros from './numberRepresentations/completeWithZeros.js'

const $form = document.getElementById('computer-operations__form')
const $numberOne = document.getElementById('number-one')
const $numberTwo = document.getElementById('number-two')
const $operation = document.getElementById('operations')
const $memory = document.getElementById('memory')
const $registers = document.getElementById('registers')
const $pc = document.getElementById('pc')
const $ir = document.getElementById('ir')
const memory = []
const registers = []

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

$operation.addEventListener('focus', () => $operation.firstElementChild.remove(), {
  once: true
})

$operation.addEventListener('change', () => {
  if ($operation.value !== 'NOT') {
    $numberTwo.removeAttribute('disabled')
    verifier.numberTwo = false
    return
  }
  verifier.numberTwo = drawInputInfo(true, $numberTwo)
  $numberTwo.parentElement.parentElement.classList.remove('form__group-correct')
  $numberTwo.setAttribute('disabled', '')
  $numberTwo.value = ''
  return
})

const verifier = {
  numberOne: false,
  numberTwo: false
}

const inputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  if (inputPressed.disabled) return
  const value = inputPressed.value
  if (inputPressed.name === 'number-one') {
    verifier.numberOne = drawInputInfo(isNumber(value), inputPressed)
  } else if (inputPressed.name === 'number-two') {
    verifier.numberTwo = drawInputInfo(isNumber(value), inputPressed)
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
  if (strInstruction !== 'NOT') {
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

    drawInMemory(iDec.m.first, hexByteToBin(hexNumber.first))
    drawInMemory(iDec.m.second, hexByteToBin(hexNumber.second))
    drawInMemory(iInstructions + iI++, new LOAD(`${iHex.r.first}${iHex.m.first}`))
    drawInMemory(iInstructions + iI++, new LOAD(`${iHex.r.second}${iHex.m.second}`))
    drawInMemory(
      iInstructions + iI++,
      createInstruction(strInstruction, `${iHex.r.result}${iHex.r.first}${iHex.r.second}`)
    )
    drawInMemory(iInstructions + iI++, new STORE(`${decToHex(`${iData + iD++}`)}${iHex.r.result}`))
    drawInMemory(iInstructions + iI++, new HALT(`000`))
  }
}

$form.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('form__message')

  if (!(verifier.numberOne && verifier.numberTwo)) {
    showFormErrorMessage(errorMessage, 'Por favor rellena el formulario correctamente', 4)
    return
  }

  try {
    blockOfInstructions('ADDI', { firstNumber: '161', secondNumber: '254' })
    // blockOfInstructions('OR', { firstNumber: '161', secondNumber: '254' })
    // blockOfInstructions('AND', { firstNumber: '161', secondNumber: '254' })
    // blockOfInstructions('XOR', { firstNumber: '161', secondNumber: '254' })

    for (const procedure of memory) {
      if (!procedure) break
      if (procedure instanceof Instruction) {
        const op = procedure.action({ memory, registers })
        if (op?.Rd) {
          insertRegisterRow($registers, binByteToHex(registers[op.Rd]), op.Rd)
        }
        if (op?.Md) {
          insertMemoryRow($memory, binByteToHex(memory[op.Md]), op.Md)
        }
      }
    }
  } catch (error) {
    console.log(error)
    showFormErrorMessage(errorMessage, 'A ocurrido un error', 4)
  }

  showFormSuccessMessage(document.getElementById('form__success-message'), 2)
  clearForm($form)
})
