const readline = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
})
const baseDecimalToAny = require('./decimalBaseToAnyBase/baseDecimalToAny')
const anyBaseToDecimal = require('./anyBaseToDecimalBase/anyBaseToDecimal')
///////////////////////////////////////////////////////////////////////////////////////////////////////

readline.on('line', line => {
  if (isNaN(line)) {
    console.log('Argument must be a number, try again:')
    return
  }

  if (line.length > 16) {
    console.log('Argument is too long')
    return
  }

  const currentBase = 2

  const newNumber = baseDecimalToAny(currentBase, line)
  console.log('Encode')
  console.log(newNumber)

  console.log('Decode')
  console.log(anyBaseToDecimal(currentBase, newNumber.integer))

  console.log()
  console.log('Write another number:')
})
