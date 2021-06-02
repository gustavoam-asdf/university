import applyEventsForm from '../../js/formHandler/applyEventsForm.js'
import {
  clearForm,
  drawInputInfo,
  showFormErrorMessage,
  showFormSuccessMessage
} from '../../js/formHandler/drawInfo.js'
import addBits from './binaryOperations/aritmetic/integers/addBits.js'
import { complementToOne, complementToTwo } from './binaryOperations/complement/encodeComplement.js'
import { shiftAritmeticRight, shiftAritmeticLeft } from './binaryOperations/shift/aritmetic.js'
import { shiftCircleLeft, shiftCircleRight } from './binaryOperations/shift/circular.js'
import { shiftLogicLeft, shiftLogicRight } from './binaryOperations/shift/logic.js'
import { existInBase, isInteger, isNumber } from './changeBase/validateNumber.js'

const numberComplementForm = document.getElementById('nc__form')
const formVerifier = {
  complement: {
    number: false,
    base: true,
    complement: false,
    hasBitSign: true
  },
  shift: {
    number: false,
    base: true,
    type: false,
    direction: false
  }
}

const complementInputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  const value = inputPressed.value
  if (inputPressed.name === 'nc__number') {
    formVerifier.complement.number = drawInputInfo(isNumber(value), inputPressed)
  } else if (inputPressed.name === 'nc__number-base') {
    formVerifier.complement.base = drawInputInfo(
      isInteger(value) && parseInt(value) > 1,
      inputPressed
    )
  } else if (inputPressed.name === 'target-complement') {
    formVerifier.complement.complement = drawInputInfo(
      value.toLowerCase() === 'c1' || value.toLowerCase() === 'c2',
      inputPressed
    )
  } else if (inputPressed.name === 'has-sign-bit') {
    formVerifier.complement.hasBitSign = drawInputInfo(
      value.toLowerCase() === 'si' || value.toLowerCase() === 'no',
      inputPressed
    )
  }
}

applyEventsForm(numberComplementForm, complementInputEventHandler)

numberComplementForm.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('nc__form__message')

  if (
    !(
      formVerifier.complement.number &&
      formVerifier.complement.base &&
      formVerifier.complement.complement &&
      formVerifier.complement.hasBitSign
    )
  ) {
    showFormErrorMessage(errorMessage, 'Por favor rellena el formulario correctamente', 5)
    return
  }

  const number = document.getElementById('nc__number').value
  const numberBase = Number(document.getElementById('nc__number-base').value)
  const targetComplement = document.getElementById('target-complement').value.toLowerCase()
  const hasSignBit = document.getElementById('has-sign-bit').value.toLowerCase()
  const result = document.getElementById('nc__result')

  if (!existInBase(number, numberBase)) {
    showFormErrorMessage(errorMessage, 'El número no existe en esa base', 5)
    clearForm(numberComplementForm)
    return
  }

  const data = { number, base: numberBase, includeSignBit: hasSignBit === 'si' ? true : false }

  if (targetComplement === 'c1') {
    result.value = complementToOne(data).number
  } else if (targetComplement === 'c2') {
    result.value = complementToTwo(data).number
  }
  showFormSuccessMessage(document.getElementById('nc__form__success-message'), 2)
  clearForm(numberComplementForm)
})

const shiftForm = document.getElementById('shift__form')

const shiftInputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  const value = inputPressed.value
  if (inputPressed.name === 'shift__number') {
    formVerifier.shift.number = drawInputInfo(isNumber(value), inputPressed)
  } else if (inputPressed.name === 'shift__number-base') {
    formVerifier.shift.base = drawInputInfo(isInteger(value) && parseInt(value) > 1, inputPressed)
  } else if (inputPressed.name === 'shift-type') {
    formVerifier.shift.type = drawInputInfo(
      value.toLowerCase() === 'aritmetico' ||
        value.toLowerCase() === 'logico' ||
        value.toLowerCase() === 'circular',
      inputPressed
    )
  } else if (inputPressed.name === 'direction') {
    formVerifier.shift.direction = drawInputInfo(
      value.toLowerCase() === 'izquierda' || value.toLowerCase() === 'derecha',
      inputPressed
    )
  }
}

applyEventsForm(shiftForm, shiftInputEventHandler)

shiftForm.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('shift__form__message')

  if (
    !(
      formVerifier.shift.number &&
      formVerifier.shift.base &&
      formVerifier.shift.type &&
      formVerifier.shift.direction
    )
  ) {
    showFormErrorMessage(errorMessage, 'Por favor rellena el formulario correctamente', 5)
    return
  }

  const number = document.getElementById('shift__number').value
  const numberBase = Number(document.getElementById('shift__number-base').value)
  const shiftType = document.getElementById('shift-type').value.toLowerCase()
  const direction = document.getElementById('direction').value.toLowerCase()
  const result = document.getElementById('shift__result')

  if (!existInBase(number, numberBase)) {
    showFormErrorMessage(errorMessage, 'El número no existe en esa base', 5)
    clearForm(numberComplementForm)
    return
  }

  let value = number
  if (numberBase !== 2) {
    value = complementToTwo({ number, base: numberBase }).number
  }

  if (shiftType === 'logico') {
    if (direction === 'izquierda') {
      result.value = shiftLogicLeft(value)
    } else if (direction === 'derecha') {
      result.value = shiftLogicRight(value)
    } else {
      throw new Error('Invalid direction')
    }
  } else if (shiftType === 'aritmetico') {
    if (direction === 'izquierda') {
      result.value = shiftAritmeticLeft(value)
    } else if (direction === 'derecha') {
      result.value = shiftAritmeticRight(value)
    } else {
      throw new Error('Invalid direction')
    }
  } else if (shiftType === 'circular') {
    if (direction === 'izquierda') {
      result.value = shiftCircleLeft(value)
    } else if (direction === 'derecha') {
      result.value = shiftCircleRight(value)
    } else {
      throw new Error('Invalid direction')
    }
  } else {
    throw new Error('Invalid shift type')
  }
  showFormSuccessMessage(document.getElementById('shift__form__success-message'), 2)
  clearForm(shiftForm)
})
// console.log('Shift aritmetica derecha')
// console.log(`Salida1-1: ${shiftAritmeticRight(number)}`)
// console.log(`Salida2-1: ${shiftAritmeticRight(shiftAritmeticRight(number))}`)
// console.log(`Salida2-2: ${shiftAritmeticRight(number, 2)}\n`)

// console.log('Shift aritmetica izquierda')
// console.log(`Salida1-1: ${shiftAritmeticLeft(number)}`)
// console.log(`Salida2-1: ${shiftAritmeticLeft(shiftAritmeticLeft(number))}`)
// console.log(`Salida2-2: ${shiftAritmeticLeft(number, 2)}\n`)

// console.log('Shift logical derecho')
// console.log(`Salida1-1: ${shiftLogicRight(number)}`)
// console.log(`Salida2-1: ${shiftLogicRight(shiftLogicRight(number))}`)
// console.log(`Salida2-2: ${shiftLogicRight(number, 2)}\n`)

// console.log('Shift logical izquierdo')
// console.log(`Salida1-1: ${shiftLogicLeft(number)}`)
// console.log(`Salida2-1: ${shiftLogicLeft(shiftLogicLeft(number))}`)
// console.log(`Salida2-2: ${shiftLogicLeft(number, 2)}\n`)

// console.log('Shift circular derecho')
// console.log(`Salida1-1: ${shiftCircleRight(number)}`)
// console.log(`Salida2-1: ${shiftCircleRight(shiftCircleRight(number))}`)
// console.log(`Salida2-2: ${shiftCircleRight(number, 2)}`)
// console.log(`Salida3-1: ${shiftCircleRight(shiftCircleRight(shiftCircleRight(number)))}`)
// console.log(`Salida3-2: ${shiftCircleRight(number, 3)}\n`)

// console.log('Shift circular izquierdo')
// console.log(`Salida1-1: ${shiftCircleLeft(number)}`)
// console.log(`Salida2-1: ${shiftCircleLeft(shiftCircleLeft(number))}`)
// console.log(`Salida2-2: ${shiftCircleLeft(number, 2)}`)
// console.log(`Salida3-1: ${shiftCircleLeft(shiftCircleLeft(shiftCircleLeft(number)))}`)
// console.log(`Salida3-2: ${shiftCircleLeft(number, 3)}\n`)
