// Another way to use numbers in Javascript because in this the numbers are implemented are really bad

/**
 * @param {String|Number} strNumber
 * @returns {String}
 */
const getInteger = strNumber => {
  if (isNaN(strNumber)) throw new TypeError('Argument most be a strNumber')
  return `${Math.floor(strNumber)}`
}

module.exports = getInteger
