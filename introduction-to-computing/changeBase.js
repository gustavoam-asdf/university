const readline = require('readline').createInterface({
  input: process.stdin,
  output: process.stdout
})

// Another way to use numbers in Javascript because in this the numbers are implemented are really bad

/**
 * @param {String|Number} strNumber
 * @returns {String}
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
  let decimalPart = 0
  let decimalsIndex = strNumber.indexOf('.')
  if (decimalsIndex !== -1) {
    decimalPart = parseFloat(`0.${strNumber.slice(decimalsIndex + 1)}`)
  }
  return decimalPart.toString()
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

/**
 * @param {Number} value
 * @returns the representation of a number greater than 10 in hexadecimal or the value entered if it isn't in the range
 */
const hexadecimalDigits = value => {
  if (isNaN(value)) throw new TypeError('Argument must be a number')
  const strValue = getInteger(value)
  if (Number(strValue) <= 15) {
    if (strValue === '10') return 'A'
    else if (strValue === '11') return 'B'
    else if (strValue === '12') return 'C'
    else if (strValue === '13') return 'D'
    else if (strValue === '14') return 'E'
    else if (strValue === '15') return 'F'
    else return strValue
  } else {
    return `(${strValue})`
  }
}

/**
 * @param {Number} dividend
 * @param {Number} divisor
 * @returns {String}
 */
const getRemainder = (dividend, divisor) => {
  if (isNaN(dividend) || isNaN(divisor)) throw new TypeError('Arguments must be numbers')
  return hexadecimalDigits(dividend % divisor)
}

///////////////////////////////////////////////////////////////////////////////////////////////////////

// Convert a number in decimal base to another base

/**
 * @param {Number} base
 * @param {Number} integer
 * @returns {String}
 */
const integerDecimalBaseTo = (base, integer) => {
  if (integer < base) return hexadecimalDigits(integer)
  const quotient = getInteger(integer / base)
  const remainder = getRemainder(integer, base)
  return `${integerDecimalBaseTo(base, quotient)}${remainder}`
}

/**
 * @param {Number} base
 * @param {Number} decimalPart
 * @param {Number} precision
 * @returns {String}
 */
const decimalsDecimalBaseTo = (base, decimalPart, precision = 0) => {
  if (precision === 10) return ''
  const numberXdecimals = decimalPart * base
  if (numberXdecimals === 0) return 0
  const digitToLeave = hexadecimalDigits(getInteger(numberXdecimals))
  const remainder = getDecimals(numberXdecimals.toString()) - getDecimals(digitToLeave)
  return `${digitToLeave}${decimalsDecimalBaseTo(base, remainder, ++precision)}`
}

const floatBaseDecimalTo = (base, strNumber) => {
  const integerPart = integerDecimalBaseTo(base, getInteger(strNumber))
  const decimalPart = decimalsDecimalBaseTo(base, getDecimals(strNumber))
  return {
    number: `${integerPart}${decimalPart === 0 ? '' : `.${decimalPart}`}`,
    integer: integerPart,
    decimal: `0.${decimalPart}`
  }
}

// Convert a number in any base to decimal base

/**
 * @param {Number} base
 * @param {String} strInteger
 */
const integerAnyBaseToDecimal = (base, strInteger) => {
  const digit = parseInt(strInteger.slice(0, 1))
  if (strInteger.length === 1) return digit
  const positionValue = base ** (strInteger.length - 1)
  return digit * positionValue + integerAnyBaseToDecimal(base, strInteger.slice(1))
}

const floatAnyBaseToDecimal = (base, strNumber) => {}

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

  const currentBase = 16

  const newNumber = floatBaseDecimalTo(currentBase, line)
  console.log(newNumber.integer)
  // console.log(newNumber.decimal)
  // console.log(newNumber.number)

  console.log('Decode')
  console.log(integerAnyBaseToDecimal(currentBase, newNumber.integer))

  console.log()
  console.log('Write another number:')
})
