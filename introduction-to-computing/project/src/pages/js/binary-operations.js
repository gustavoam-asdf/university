import { shiftAritmeticRight, shiftAritmeticLeft } from './binaryOperations/shift/aritmetic.js'
import { shiftCircleLeft, shiftCircleRight } from './binaryOperations/shift/circular.js'
import { shiftLogicLeft, shiftLogicRight } from './binaryOperations/shift/logic.js'

const number = '10101001'

console.log(`Inicio   : ${number}`)

console.log('Shift aritmetica derecha')
console.log(`Salida1-1: ${shiftAritmeticRight(number)}`)
console.log(`Salida2-1: ${shiftAritmeticRight(shiftAritmeticRight(number))}`)
console.log(`Salida2-2: ${shiftAritmeticRight(number, 2)}\n`)

console.log('Shift aritmetica izquierda')
console.log(`Salida1-1: ${shiftAritmeticLeft(number)}`)
console.log(`Salida2-1: ${shiftAritmeticLeft(shiftAritmeticLeft(number))}`)
console.log(`Salida2-2: ${shiftAritmeticLeft(number, 2)}\n`)

console.log('Shift logical derecho')
console.log(`Salida1-1: ${shiftLogicRight(number)}`)
console.log(`Salida2-1: ${shiftLogicRight(shiftLogicRight(number))}`)
console.log(`Salida2-2: ${shiftLogicRight(number, 2)}\n`)

console.log('Shift logical izquierdo')
console.log(`Salida1-1: ${shiftLogicLeft(number)}`)
console.log(`Salida2-1: ${shiftLogicLeft(shiftLogicLeft(number))}`)
console.log(`Salida2-2: ${shiftLogicLeft(number, 2)}\n`)

console.log('Shift circular derecho')
console.log(`Salida1-1: ${shiftCircleRight(number)}`)
console.log(`Salida2-1: ${shiftCircleRight(shiftCircleRight(number))}`)
console.log(`Salida2-2: ${shiftCircleRight(number, 2)}`)
console.log(`Salida3-1: ${shiftCircleRight(shiftCircleRight(shiftCircleRight(number)))}`)
console.log(`Salida3-2: ${shiftCircleRight(number, 3)}\n`)

console.log('Shift circular izquierdo')
console.log(`Salida1-1: ${shiftCircleLeft(number)}`)
console.log(`Salida2-1: ${shiftCircleLeft(shiftCircleLeft(number))}`)
console.log(`Salida2-2: ${shiftCircleLeft(number, 2)}`)
console.log(`Salida3-1: ${shiftCircleLeft(shiftCircleLeft(shiftCircleLeft(number)))}`)
console.log(`Salida3-2: ${shiftCircleLeft(number, 3)}\n`)
