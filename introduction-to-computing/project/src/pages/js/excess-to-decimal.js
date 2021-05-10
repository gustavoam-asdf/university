import {
  clearForm,
  drawInputInfo,
  showFormErrorMessage,
  showFormSuccessMessage
} from '../../js/formHandler/drawInfo.js'
import applyEventsForm from '../../js/formHandler/applyEventsForm.js'

import encodeToExcess from './numberRepresentations/ieee754/encodeToExcess.js'
import { isNumber } from './changeBase/validateNumber.js'
import ExcessToDecimal from './numberRepresentations/ieee754/decodeExcess.js'

const numberRepresentation = document.getElementById('number-representation__form')

const verifier = {
  number: false,
  currentExcess: false
}

const inputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  const value = inputPressed.value
  if (inputPressed.name === 'excess-number') {
    verifier.number = drawInputInfo(
      isNumber(value) && (value.length === 32 || value.length === 64),
      inputPressed
    )
  } else if (inputPressed.name === 'current-excess') {
    verifier.currentExcess = drawInputInfo(value === '127' || value === '1023', inputPressed)
  }
}

applyEventsForm(numberRepresentation, inputEventHandler)

numberRepresentation.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('form__message')

  if (!(verifier.number && verifier.currentExcess)) {
    showFormErrorMessage(errorMessage, 'Por favor rellena el formulario correctamente', 5)
    return
  }

  const number = document.getElementById('excess-number').value
  const currentExcess = Number(document.getElementById('current-excess').value)
  const $decode = document.getElementById('decode')

  // console.log(
  //   ExcessToDecimal(1023, '0100000000100100000000000000000000000000000000000000000000000000')
  // )

  try {
    $decode.value = ExcessToDecimal(currentExcess, number)
  } catch (error) {
    console.log(error)
    showFormErrorMessage(errorMessage, 'A ocurrido un error', 4)
  }

  showFormSuccessMessage(document.getElementById('form__success-message'), 2)
  clearForm(numberRepresentation)
})
