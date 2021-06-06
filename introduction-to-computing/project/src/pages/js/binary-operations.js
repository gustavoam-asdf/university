import applyEventsForm from '../../js/formHandler/applyEventsForm.js'
import {
  clearForm,
  drawInputInfo,
  showFormErrorMessage,
  showFormSuccessMessage
} from '../../js/formHandler/drawInfo.js'
import addBits from './binaryOperations/aritmetic/integers/addBits.js'
import hasOverflow from './binaryOperations/aritmetic/integers/hasOverflow.js'
import substractBits from './binaryOperations/aritmetic/integers/substractBits.js'
import {
  complementOneToDecimal,
  complementTwoToDecimal
} from './binaryOperations/complement/decodeComplement.js'
import { complementToOne, complementToTwo } from './binaryOperations/complement/encodeComplement.js'
import { shiftAritmeticRight, shiftAritmeticLeft } from './binaryOperations/shift/aritmetic.js'
import { shiftCircleLeft, shiftCircleRight } from './binaryOperations/shift/circular.js'
import { shiftLogicLeft, shiftLogicRight } from './binaryOperations/shift/logic.js'
import { existInBase, isHex, isInteger } from './changeBase/validateNumber.js'

const numberComplementForm = document.getElementById('nc__form')
const formVerifier = {
  complement: {
    number: false,
    base: true
  },
  shift: {
    number: false,
    base: true,
    type: false,
    direction: false
  },
  add: {
    firstNumber: false,
    secondNumber: false
  },
  substract: {
    firstNumber: false,
    secondNumber: false
  }
}

/*************************************************************************************************/

const complementInputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  const value = inputPressed.value
  if (inputPressed.name === 'nc__number') {
    formVerifier.complement.number = drawInputInfo(isHex(value), inputPressed)
  } else if (inputPressed.name === 'nc__number-base') {
    formVerifier.complement.base = drawInputInfo(
      isInteger(value) && parseInt(value) > 1,
      inputPressed
    )
  }
}

applyEventsForm(numberComplementForm, complementInputEventHandler)

numberComplementForm.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('nc__form__message')

  if (!(formVerifier.complement.number && formVerifier.complement.base)) {
    showFormErrorMessage(errorMessage, 'Por favor rellena el formulario correctamente', 5)
    return
  }

  const number = document.getElementById('nc__number').value
  const numberBase = Number(document.getElementById('nc__number-base').value)
  const resultOne = document.getElementById('nc__result-one')
  const resultTwo = document.getElementById('nc__result-two')

  if (!existInBase(number, numberBase)) {
    showFormErrorMessage(errorMessage, 'El número no existe en esa base', 5)
    clearForm(numberComplementForm)
    return
  }

  const data = { number, base: numberBase }

  resultOne.value = complementToOne(data).number
  resultTwo.value = complementToTwo(data).number

  showFormSuccessMessage(document.getElementById('nc__form__success-message'), 2)
  clearForm(numberComplementForm)
})

/*************************************************************************************************/

const shiftForm = document.getElementById('shift__form')

const shiftInputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  const value = inputPressed.value
  if (inputPressed.name === 'shift__number') {
    formVerifier.shift.number = drawInputInfo(isHex(value), inputPressed)
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
      showFormErrorMessage(errorMessage, 'A ocurrido un error', 4)
    }
  } else if (shiftType === 'aritmetico') {
    if (direction === 'izquierda') {
      result.value = shiftAritmeticLeft(value)
    } else if (direction === 'derecha') {
      result.value = shiftAritmeticRight(value)
    } else {
      showFormErrorMessage(errorMessage, 'A ocurrido un error', 4)
    }
  } else if (shiftType === 'circular') {
    if (direction === 'izquierda') {
      result.value = shiftCircleLeft(value)
    } else if (direction === 'derecha') {
      result.value = shiftCircleRight(value)
    } else {
      showFormErrorMessage(errorMessage, 'A ocurrido un error', 4)
    }
  } else {
    throw new Error('Invalid shift type')
  }
  showFormSuccessMessage(document.getElementById('shift__form__success-message'), 2)
  clearForm(shiftForm)
})

/*************************************************************************************************/

const addIntegerForm = document.getElementById('ai__form')

const addIntegerInputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  const value = inputPressed.value
  if (inputPressed.name === 'ai__number__one') {
    formVerifier.add.firstNumber = drawInputInfo(
      existInBase(value, 2) && value.slice(0, 1) !== '-',
      inputPressed
    )
  } else if (inputPressed.name === 'ai__number__two') {
    formVerifier.add.secondNumber = drawInputInfo(
      existInBase(value, 2) && value.slice(0, 1) !== '-',
      inputPressed
    )
  }
}

applyEventsForm(addIntegerForm, addIntegerInputEventHandler)

addIntegerForm.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('ai__form__message')

  if (!(formVerifier.add.firstNumber && formVerifier.add.secondNumber)) {
    showFormErrorMessage(errorMessage, 'Uno de los números es incorrecto', 5)
    return
  }

  const firstNumber = document.getElementById('ai__number__one').value
  const secondNumber = document.getElementById('ai__number__two').value
  const result = document.getElementById('ai__result')

  const operation = addBits({ firstNumber, secondNumber })
  const overflow = hasOverflow({ firstNumber, secondNumber, result: operation, operator: '+' })

  result.value = operation
  if (overflow) {
    showFormErrorMessage(errorMessage, 'Ocurrio un overflow', 15)
    return
  }

  showFormSuccessMessage(document.getElementById('ai__form__success-message'), 2)
  clearForm(shiftForm)
})

/*************************************************************************************************/

const substIntegerForm = document.getElementById('si__form')

const substIntegerInputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  const value = inputPressed.value
  if (inputPressed.name === 'si__number__one') {
    formVerifier.substract.firstNumber = drawInputInfo(
      existInBase(value, 2) && value.slice(0, 1) !== '-',
      inputPressed
    )
  } else if (inputPressed.name === 'si__number__two') {
    formVerifier.substract.secondNumber = drawInputInfo(
      existInBase(value, 2) && value.slice(0, 1) !== '-',
      inputPressed
    )
  }
}

applyEventsForm(substIntegerForm, substIntegerInputEventHandler)

substIntegerForm.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('si__form__message')

  if (!(formVerifier.substract.firstNumber && formVerifier.substract.secondNumber)) {
    showFormErrorMessage(errorMessage, 'Uno de los números es incorrecto', 5)
    return
  }

  const firstNumber = document.getElementById('si__number__one').value
  const secondNumber = document.getElementById('si__number__two').value
  const result = document.getElementById('si__result')

  const operation = substractBits({ firstNumber, secondNumber })
  const overflow = hasOverflow({ firstNumber, secondNumber, result: operation, operator: '-' })

  result.value = operation
  if (overflow) {
    showFormErrorMessage(errorMessage, 'Ocurrio un overflow', 15)
    return
  }

  showFormSuccessMessage(document.getElementById('si__form__success-message'), 2)
  clearForm(shiftForm)
})

// Examples
const op1 = {
  firstNumber: '00010001',
  operator: '+',
  secondNumber: '00010110'
}

op1.result = addBits(op1)
console.log(op1)
console.log(hasOverflow(op1))

const op2 = {
  firstNumber: '00011000',
  operator: '+',
  secondNumber: '11101111'
}

op2.result = addBits(op2)

console.log(op2)
console.log(hasOverflow(op2))

const op3 = {
  firstNumber: '00011000',
  operator: '-',
  secondNumber: '11101111'
}

op3.result = substractBits(op3)

console.log(op3)
console.log(hasOverflow(op3))

const op4 = {
  firstNumber: '11011101',
  operator: '-',
  secondNumber: '00010100'
}

op4.result = substractBits(op4)

console.log(op4)
console.log(hasOverflow(op4))

const op5 = {
  firstNumber: '01111111',
  operator: '+',
  secondNumber: '00000011'
}

op5.result = addBits(op5)

console.log(op5)
console.log(hasOverflow(op5))
