import {
  clearForm,
  drawInputInfo,
  showFormErrorMessage,
  showFormSuccessMessage
} from '../../js/formHandler/drawInfo.js'
import { existInBase, isHex, isInteger } from './changeBase/validateNumber.js'
import decimalToAny from './changeBase/decimalBaseToAnyBase/decimalToAny.js'
import anyToDecimal from './changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import applyEventsForm from '../../js/formHandler/applyEventsForm.js'
import './numberRepresentations/numberRepresentation.js'

const numberRepresentation = document.getElementById('number-representation__form')

const verifier = {
  number: false,
  currentBase: false,
  targetBase: false
}

const inputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  const value = inputPressed.value
  if (inputPressed.name === 'number') {
    verifier.number = drawInputInfo(isHex(value), inputPressed)
  } else if (inputPressed.name === 'current-base') {
    verifier.currentBase = drawInputInfo(isInteger(value) && parseInt(value) > 1, inputPressed)
  } else if (inputPressed.name === 'target-base') {
    const currentBase = document.getElementById('current-base')
    verifier.targetBase = drawInputInfo(
      isInteger(value) && value !== currentBase.value && parseInt(value) > 1,
      inputPressed
    )
  }
}

applyEventsForm(numberRepresentation, inputEventHandler)

numberRepresentation.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('form__message')

  if (!(verifier.number && verifier.currentBase && verifier.targetBase)) {
    showFormErrorMessage(errorMessage, 'Por favor rellena el formulario correctamente', 5)
    return
  }

  const number = document.getElementById('number').value
  const currentBase = Number(document.getElementById('current-base').value)
  const targetBase = Number(document.getElementById('target-base').value)
  const result = document.getElementById('result')

  if (!existInBase(number, currentBase)) {
    showFormErrorMessage(errorMessage, 'El número que ingresó no existe en esa base', 3)
    clearForm(numberRepresentation)
    return
  }

  let numberResult
  if (currentBase === 10) {
    numberResult = decimalToAny(targetBase, number)
  } else {
    numberResult = anyToDecimal(currentBase, number)
    numberResult = decimalToAny(targetBase, numberResult.number)
  }
  result.value = numberResult.number

  showFormSuccessMessage(document.getElementById('form__success-message'), 2)
  clearForm(numberRepresentation)
})
