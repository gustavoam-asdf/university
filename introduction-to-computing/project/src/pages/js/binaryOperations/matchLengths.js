import completeWithZeros from '../numberRepresentations/completeWithZeros.js'

const matchLengths = ({ firstNumber, secondNumber }) => {
  if (typeof firstNumber !== 'string')
    throw new TypeError('First number must be a number type string')
  if (typeof secondNumber !== 'string')
    throw new TypeError('Second number must be a number type string')

  const result = { firstNumber, secondNumber }
  if (firstNumber.length >= secondNumber.length) {
    result.secondNumber = completeWithZeros({ unsignedNumber: secondNumber }, firstNumber.length)
  } else {
    result.firstNumber = completeWithZeros({ unsignedNumber: firstNumber }, secondNumber.length)
  }

  return result
}

export default matchLengths
