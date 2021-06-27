import { decToHex } from '../simpleChangeBase.js'
import zerosLeftTo from '../zerosLeftTo.js'
/**
 * @param {Element} $memory
 * @param {String} contents
 * @param {String} address
 */
export const insertMemoryRow = ($memory, contents, address) => {
  $memory.insertAdjacentHTML(
    'beforeend',
    `
    <div class="memory__row">
      <div class="contents">${contents}</div>
      <div class="address">${zerosLeftTo(2, decToHex(`${address}`))}</div>
    </div>
  `
  )
}

/**
 * @param {Element} $memory
 * @param {String} contents
 * @param {String} address
 */
export const insertRegisterRow = ($registers, contents, address) => {
  $registers.insertAdjacentHTML(
    'beforeend',
    `
    <div class="registers__row">
      <div class="address">R${zerosLeftTo(2, decToHex(`${address}`))}</div>
      <div class="contents">${contents}</div>
    </div>
  `
  )
}
