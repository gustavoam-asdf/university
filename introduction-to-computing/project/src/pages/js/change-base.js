import { existInBase, isHex, isInteger } from './changeBase/validateNumber.js'
import decimalToAny from './changeBase/decimalBaseToAnyBase/decimalToAny.js'
import anyToDecimal from './changeBase/anyBaseToDecimalBase/anyToDecimal.js'

const changeBaseForm = document.getElementById('change-base__form')

const verifier = {
  number: false,
  currentBase: false,
  targetBase: false
}

/**
 * Show information about whether the target input value
 * @param {Boolean} test check the text of target
 * @param {Element} targetInput element to draw its info
 */
const drawInfo = (test, targetInput) => {
  const groupInput = targetInput.parentElement.parentElement
  if (test) {
    groupInput.classList.remove('form__group-incorrect')
    groupInput.classList.add('form__group-correct')
    groupInput.querySelector('i').classList.remove('fa-times-circle')
    groupInput.querySelector('i').classList.add('fa-check-circle')
  } else {
    groupInput.classList.remove('form__group-correct')
    groupInput.classList.add('form__group-incorrect')
    document.querySelector('i').classList.remove('fa-check-circle')
    document.querySelector('i').classList.add('fa-times-circle')
  }
  return test
}

const inputHandler = targetInput => {
  const value = targetInput.value
  if (targetInput.name === 'number') {
    verifier.number = drawInfo(isHex(value), targetInput)
  } else if (targetInput.name === 'current-base') {
    verifier.currentBase = drawInfo(isInteger(value) && parseInt(value) > 1, targetInput)
  } else if (targetInput.name === 'target-base') {
    const currentBase = document.getElementById('current-base')
    verifier.targetBase = drawInfo(
      isInteger(value) && value !== currentBase.value && parseInt(value) > 1,
      targetInput
    )
  }
}

const inputEventHandler = evt => {
  const inputPressed = evt.target.closest('input')
  if (!inputPressed) return
  inputHandler(inputPressed)
}

changeBaseForm.addEventListener('keyup', inputEventHandler)
changeBaseForm.addEventListener('keydown', inputEventHandler)
changeBaseForm.addEventListener('blur', inputEventHandler)
changeBaseForm.addEventListener('focus', inputEventHandler)
changeBaseForm.addEventListener('change', inputEventHandler)
changeBaseForm.addEventListener('paste', inputEventHandler)

changeBaseForm.addEventListener('submit', evt => {
  evt.preventDefault()
  const errorMessage = document.getElementById('form__message')

  const number = document.getElementById('number').value
  const currentBase = Number(document.getElementById('current-base').value)
  const targetBase = Number(document.getElementById('target-base').value)
  const result = document.getElementById('result')

  if (verifier.number && verifier.currentBase && verifier.targetBase) {
    if (!existInBase(number, currentBase)) {
      errorMessage.lastChild.textContent = ' El número que ingresó no existe en esa base'
      errorMessage.classList.add('form__message-active')
      setTimeout(() => {
        errorMessage.classList.add('form__message-active')
      }, 1000)
      return
    }
    errorMessage.classList.remove('form__message-active')
    document.getElementById('form__success-message').classList.add('form__success-message-active')
    setTimeout(() => {
      document
        .getElementById('form__success-message')
        .classList.remove('form__success-message-active')
    }, 2000)
    document
      .querySelectorAll('.form__group')
      .forEach(group => group.classList.remove('form__group-correct'))

    let numberResult
    if (currentBase === 10) {
      numberResult = decimalToAny(targetBase, number)
    } else {
      numberResult = anyToDecimal(currentBase, number)
      numberResult = decimalToAny(targetBase, numberResult.number)
    }
    result.value = numberResult.number
  } else {
    errorMessage.lastChild.textContent = ' Por favor rellena el formulario correctamente'
    errorMessage.classList.add('form__message-active')
  }
})
