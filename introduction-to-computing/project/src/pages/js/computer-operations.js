import applyEventsForm from '../../js/formHandler/applyEventsForm.js'
import {
  clearForm,
  drawInputInfo,
  showFormErrorMessage,
  showFormSuccessMessage
} from '../../js/formHandler/drawInfo.js'
import { isNumber } from './changeBase/validateNumber.js'
import { hexByteToBin } from './computerOperations/byteFuffer.js'
import drawInMemory from './computerOperations/gui/drawInMemory.js'
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
import completeWithZeros from './numberRepresentations/completeWithZeros.js'

const $form = document.getElementById('computer-operations__form')
const $numberOne = document.getElementById('number-one')
const $numberTwo = document.getElementById('number-two')
const $operation = document.getElementById('operations')
const $memory = document.getElementById('memory')
const $registers = document.getElementById('registers')
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
      first: `${'0'.repeat(4 - decToHex(firstNumber).length)}${decToHex(firstNumber)}`,
      second: `${'0'.repeat(4 - decToHex(secondNumber).length)}${decToHex(secondNumber)}`
    }

    const draw = (position, instruction) => drawInMemory($memory, memory, position, instruction)

    draw(iDec.m.first, hexByteToBin(hexNumber.first))
    draw(iDec.m.second, hexByteToBin(hexNumber.second))
    draw(iInstructions + iI++, new LOAD(`${iHex.r.first}${iHex.m.first}`))
    draw(iInstructions + iI++, new LOAD(`${iHex.r.second}${iHex.m.second}`))
    draw(
      iInstructions + iI++,
      createInstruction(strInstruction, `${iHex.r.result}${iHex.r.first}${iHex.r.second}`)
    )
    draw(iInstructions + iI++, new STORE(`${decToHex(`${iData + iD++}`)}${iHex.r.result}`))
    draw(iInstructions + iI++, new HALT(`000`))
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
  } catch (error) {
    console.log(error)
    showFormErrorMessage(errorMessage, 'A ocurrido un error', 4)
  }

  showFormSuccessMessage(document.getElementById('form__success-message'), 2)
  clearForm($form)
})

blockOfInstructions('ADDI', { firstNumber: '161', secondNumber: '254' })
blockOfInstructions('OR', { firstNumber: '161', secondNumber: '254' })
blockOfInstructions('AND', { firstNumber: '161', secondNumber: '254' })
blockOfInstructions('XOR', { firstNumber: '161', secondNumber: '254' })

for (const procedure of memory) {
  if (!procedure) break
  if (procedure instanceof Instruction) {
    procedure.action({ memory, registers })
    console.log(procedure)
  } else if (procedure) {
    console.log(procedure)
  }
}

console.log('')
console.log(registers.map(register => binToDec(register)))
console.log(memory)
