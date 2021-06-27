import { decToHex } from '../simpleChangeBase.js'

/**
 * @param {Element} $memory
 * @param {String} contents
 * @param {String} address
 */
export const insertMemoryRow = ($memory, contents, address) => {
  console.log({ contents, address })
  $memory.insertAdjacentHTML(
    'beforeend',
    `
    <div class="memory__row">
      <div class="contents">${contents}</div>
      <div class="address">${`${'0'.repeat(2 - decToHex(`${address}`).length)}${decToHex(
        `${address}`
      )}`}</div>
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
      <div class="address">R${`${'0'.repeat(2 - decToHex(`${address}`).length)}${decToHex(
        `${address}`
      )}`}</div>
      <div class="contents">${contents}</div>
    </div>
  `
  )
}
