const readline = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
})

/**
 * @param {Number} dividend
 * @param {Number} divisor
 * @returns {String}
 */
const getRemainder = (dividend, divisor) => {
  if (isNaN(dividend) || isNaN(divisor)) throw new TypeError('Arguments must be numbers')
  if (dividend % divisor >= 10) {
    if (dividend % divisor === 10) return 'A'
    else if (dividend % divisor === 11) return 'B'
    else if (dividend % divisor === 12) return 'C'
    else if (dividend % divisor === 13) return 'D'
    else if (dividend % divisor === 14) return 'E'
    else if (dividend % divisor === 15) return 'F'
    else return `(${dividend % divisor})`
  }
  return `${dividend % divisor}`
}

// Another way to use numbers in Javascript because in this the numbers are implemented are really bad

/**
 * @param {String} strNumber
 */
const getInteger = strNumber => {
  if (isNaN(strNumber)) throw new TypeError('Argument most be a strNumber')
  return `${Math.floor(strNumber)}`
}

/**
 * @param {String} strNumber
 */
const getDecimals = strNumber => {
  if (isNaN(strNumber)) throw new TypeError('Argument most be a number')
  let decimals = 0
  let decimalsIndex = strNumber.indexOf('.')
  if (decimalsIndex !== -1) {
    decimals = parseFloat(`0.${strNumber.slice(decimalsIndex + 1)}`)
  }
  return decimals.toString()
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

// Convert a number in decimal base to another base

/**
 * @param {Number} base
 * @param {Number} integer
 * @returns {String}
 */
const integerBaseTo = (base, integer) => {
  if (integer < base) return integer
  const quotient = getInteger(integer / base)
  const remainder = getRemainder(integer, base)
  return `${integerBaseTo(base, quotient)}${remainder}`
}

/**
 * @param {Number} base
 * @param {Number} decimals
 * @param {Number} precision
 * @returns {String}
 */
const decimalsBaseTo = (base, decimals, precision = 0) => {
  if (precision === 10) return ''
  if (base * decimals === 0) return 0
  const numberXdecimals = decimals * base
  const digitToLeave = getInteger(numberXdecimals)
  const remainder = getDecimals(numberXdecimals.toString()) - getDecimals(digitToLeave.toString())
  return `${digitToLeave}${decimalsBaseTo(base, remainder, ++precision)}`
}

const floatBaseTo = (base, strNumber) => {
  let integerPart = getInteger(strNumber)
  let decimals = getDecimals(strNumber)
  return {
    number: `${integerBaseTo(base, integerPart)}.${decimalsBaseTo(base, decimals)}`,
    integer: integerBaseTo(base, integerPart),
    decimal: `0.${decimalsBaseTo(base, decimals)}`
  }
}

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

  const newNumber = floatBaseTo(2, line)
  console.log(newNumber.integer)
  console.log(newNumber.decimal)
  console.log(Number(newNumber.number))

  console.log()
  console.log('Write another number:')
})
