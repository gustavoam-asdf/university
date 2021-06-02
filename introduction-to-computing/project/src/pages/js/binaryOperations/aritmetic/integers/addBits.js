import completeWithZeros from '../../../numberRepresentations/completeWithZeros.js'

const addBits = (firstNumber, secondNumber, expand = false) => {
  const numbers = { first: firstNumber, second: secondNumber }
  if (firstNumber.length >= secondNumber.length) {
    numbers.second = completeWithZeros({ unsignedNumber: secondNumber }, firstNumber.length)
  } else {
    numbers.first = completeWithZeros({ unsignedNumber: firstNumber }, secondNumber.length)
  }

  let carry = 0

  const result = [...numbers.first]
    .map((bit, i, self) => {
      const lastBit = {
        first: self[self.length - i - 1],
        second: [...numbers.second][self.length - i - 1]
      }
      const xor = lastBit.first ^ lastBit.second ^ carry
      carry =
        (lastBit.first === '1' && lastBit.second === '1') ||
        (carry === 1 && (lastBit.first === '1' || lastBit.second === '1'))
          ? 1
          : 0

      return xor
    })
    .reverse()
    .join('')

  if (expand) return carry === 0 ? result : `1${result}`
  return result
}

export default addBits
