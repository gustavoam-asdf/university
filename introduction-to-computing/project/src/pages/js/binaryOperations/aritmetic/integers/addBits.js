import completeWithZeros from '../../../numberRepresentations/completeWithZeros.js'

const addBits = (firstNumber, secondNumber, carry = 0) => {
  if (secondNumber.length > firstNumber.length) throw new Error('Error')

  const numbers = {
    first: firstNumber,
    second: completeWithZeros({ unsignedNumber: secondNumber }, firstNumber.length)
  }

  const lastBit = {
    first: [...numbers.first].reverse()[0],
    second: [...numbers.second].reverse()[0]
  }

  const newCarry =
    (lastBit.first === '1' && lastBit.second === '1') ||
    (carry === 1 && (lastBit.first === '1' || lastBit.second === '1'))
      ? 1
      : 0

  const outputBit = lastBit.first ^ lastBit.second ^ carry

  if (firstNumber.length === 1) {
    return `${outputBit}`
  }
  const nextAddFN = numbers.first.slice(0, -1)
  const nextAddSN = numbers.second.slice(0, -1)

  return `${addBits(nextAddFN, nextAddSN, newCarry)}${outputBit}`
}

export default addBits
