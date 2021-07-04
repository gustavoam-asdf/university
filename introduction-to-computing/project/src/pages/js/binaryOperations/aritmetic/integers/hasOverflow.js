import { complementTwoToDecimal } from '../../complement/decodeComplement.js'

const hasOverflow = ({ firstNumber, secondNumber, result, operator }) => {
  const dec = {
    firstNumber: Number(complementTwoToDecimal({ number: firstNumber })),
    secondNumber: Number(complementTwoToDecimal({ number: secondNumber })),
    result: Number(complementTwoToDecimal({ number: result }))
  }

  let operationalResult
  if (operator === '+') {
    operationalResult = dec.firstNumber + dec.secondNumber
  } else if (operator === '-') {
    operationalResult = dec.firstNumber - dec.secondNumber
  } else {
    throw new Error('Invalid operator')
  }

  return operationalResult !== dec.result
}

export default hasOverflow
