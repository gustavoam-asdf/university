const readline = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
})

const decimalToAny = require('./decimalBaseToAnyBase/decimalToAny')
const anyToDecimal = require('./anyBaseToDecimalBase/anyToDecimal')

readline.on('line', line => {
  if (isNaN(line)) {
    console.log('Argument must be a number, try again:')
    return
  }

  if (line.length > 16) {
    console.log('Argument is too long')
    return
  }

  const currentBase = 16

  const encodeNumber = decimalToAny(currentBase, line)
  console.log('Encode')
  console.log(encodeNumber)

  const decodeNumber = anyToDecimal(currentBase, encodeNumber.number)
  console.log('Decode')
  console.log(decodeNumber)

  console.log()
  console.log('Write another number:')
})
