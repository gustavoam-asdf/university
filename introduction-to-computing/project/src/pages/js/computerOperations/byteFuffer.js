import anyToDecimal from '../changeBase/anyBaseToDecimalBase/anyToDecimal.js'
import decimalToAny from '../changeBase/decimalBaseToAnyBase/decimalToAny.js'
import completeWithZeros from '../numberRepresentations/completeWithZeros.js'
import { existInBase } from '../changeBase/validateNumber.js'

const hexToBin = strNumber => decimalToAny(2, anyToDecimal(16, strNumber).number).number
const binToHex = strNumber => decimalToAny(16, anyToDecimal(2, strNumber).number).number

const verifyByteBuffer = ({ byteBuffer, base, testLength }) => {
  if (typeof byteBuffer !== 'string')
    return { ok: false, error: new TypeError('Byte buffer must be type string') }
  if (!existInBase(byteBuffer, base))
    return { ok: false, error: new Error(`Byte buffer must be in base ${base}`) }
  if (testLength) return { ok: false, error: new Error('Format length does not pass test') }

  return { ok: true, error: undefined }
}

const hexByteToBin = byteBuffer => {
  const verifier = verifyByteBuffer({ byteBuffer, base: 16 })
  if (!verifier.ok) throw verifier.error

  return [...byteBuffer].reduce((acc, byte) => {
    return (acc += completeWithZeros({ unsignedNumber: hexToBin(byte) }, 4))
  }, '')
}

const binByteToHex = byteBuffer => {
  const verifier = verifyByteBuffer({
    byteBuffer,
    base: 2,
    testLength: byteBuffer.length % 4 !== 0
  })
  if (!verifier.ok) throw verifier.error

  const bytes = byteBuffer.replace(/([01]{4})(\B)/g, '$1 ').split(' ')

  return bytes.reduce((acc, byte) => {
    return (acc += binToHex(byte))
  }, '')
}

export { binByteToHex, hexByteToBin, verifyByteBuffer }
