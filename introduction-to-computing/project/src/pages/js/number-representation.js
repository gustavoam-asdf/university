import {
  clearForm,
  drawInputInfo,
  showFormErrorMessage,
  showFormSuccessMessage
} from '../../js/formHandler/drawInfo.js'
import applyEventsForm from '../../js/formHandler/applyEventsForm.js'

import encodeToExcess from './numberRepresentations/ieee754/encodeToExcess.js'
import { isNumber } from './changeBase/validateNumber.js'
import getDecimals from './changeBase/getDecimals.js'
import ExcessToDecimal from './numberRepresentations/ieee754/decodeExcess.js'

const numberRepresentation = document.getElementById('number-representation__form')

const verifier = {
  number: false,
  targetExcess: false
}

const inputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  const value = inputPressed.value
  if (inputPressed.name === 'number') {
    let decimals
    try {
      decimals = getDecimals(value)
    } catch (error) {
      decimals = ''
    }
    const test = isNumber(value) && decimals.length <= 10
    verifier.number = drawInputInfo(test, inputPressed)
  } else if (inputPressed.name === 'target-excess') {
    verifier.targetExcess = drawInputInfo(value === '127' || value === '1023', inputPressed)
  }
}

applyEventsForm(numberRepresentation, inputEventHandler)

numberRepresentation.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('form__message')

  if (!(verifier.number && verifier.targetExcess)) {
    showFormErrorMessage(errorMessage, 'Por favor rellena el formulario correctamente', 4)
    return
  }

  const number = document.getElementById('number').value
  const targetExcess = Number(document.getElementById('target-excess').value)
  const $sign = document.getElementById('sign')
  const $exponent = document.getElementById('exponent')
  const $mantissa = document.getElementById('mantissa')
  const $decode = document.getElementById('decode')

  try {
    const { sign, exponent, mantissa } = encodeToExcess(targetExcess, number)
    $sign.value = sign
    $exponent.value = exponent
    $mantissa.value = mantissa
    $decode.value = ExcessToDecimal(targetExcess, `${sign}${exponent}${mantissa}`)
  } catch (error) {
    console.log(error)
    showFormErrorMessage(errorMessage, 'A ocurrido un error', 4)
  }

  showFormSuccessMessage(document.getElementById('form__success-message'), 2)
  clearForm(numberRepresentation)
})
