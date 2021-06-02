import applyEventsForm from '../../js/formHandler/applyEventsForm.js'
import { clearForm, drawInputInfo, showFormErrorMessage } from '../../js/formHandler/drawInfo.js'
import addBits from './binaryOperations/aritmetic/integers/addBits.js'
import RestofBits from './binaryOperations/aritmetic/integers/substractBits.js'
import { complementToOne, complementToTwo } from './binaryOperations/complement/encodeComplement.js'
import { shiftAritmeticRight, shiftAritmeticLeft } from './binaryOperations/shift/aritmetic.js'
import { shiftCircleLeft, shiftCircleRight } from './binaryOperations/shift/circular.js'
import { shiftLogicLeft, shiftLogicRight } from './binaryOperations/shift/logic.js'
import { existInBase, isInteger, isNumber } from './changeBase/validateNumber.js'
import firstDigit from './changeBase/firstDigit.js'

const numberComplementForm = document.getElementById('nc__form')
const formVerifier = {
  complement: {
    number: false,
    base: true,
    complement: false,
    hasBitSign: true
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
  const numberBase = document.getElementById('nc__number-base').value
  const targetComplement = document.getElementById('target-complement').value.toLowerCase()
  const hasSignBit = document.getElementById('has-sign-bit').value.toLowerCase()
  const result = document.getElementById('nc__result')

  if (!existInBase(number, numberBase)) {
    showFormErrorMessage(errorMessage, 'El número no existe en esa base', 5)
    clearForm(numberComplementForm)
    return
  }

  if (targetComplement === 'c1') {
    result.value = complementToOne({
      number,
      base: Number(numberBase),
      includeSignBit: hasSignBit === 'si' ? true : false
    }).number
  } else if (targetComplement === 'c2') {
    result.value = complementToTwo({
      number,
      base: Number(numberBase),
      includeSignBit: hasSignBit === 'si' ? true : false
    }).number
  }
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

// const number = '11111111'
// console.log('Complemento a 1')
// console.log(complementToOne({ number }))
// console.log('Complemento a 2')
// console.log(complementToTwo({ number }))
const num1 = '00011000'
const num2 = '11101111'
const operation = '+'

console.log(`Primer Número : ${num1}`)
console.log(`Operación : ${operation}`)
console.log(`Segundo Número : ${num2}`)

console.log('Resultado: ')
console.log(RestofBits(num1, num2, operation))

console.log('==================================')
console.log('numero 1 c2: ')
console.log(complementToTwo({ number: num1 , base: 2, includeSignBit: true}))



