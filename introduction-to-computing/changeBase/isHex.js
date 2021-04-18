/**
 * @param {String} strNumber
 * @returns
 */
const isHex = strNumber => {
  return strNumber.search(/^[0-9A-F]+(\.[0-9A-F]+)?$/) !== -1
}

module.exports = isHex
