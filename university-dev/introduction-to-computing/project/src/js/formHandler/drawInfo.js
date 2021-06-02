/**
 * Show information about whether the target input value
 * @param {Boolean} test check the text of target
 * @param {Element} targetInput element to draw its info
 */
export const drawInputInfo = (test, targetInput) => {
  const groupInput = targetInput.parentElement.parentElement
  if (test) {
    groupInput.classList.remove('form__group-incorrect')
    groupInput.classList.add('form__group-correct')
    groupInput.querySelector('i').classList.remove('fa-times-circle')
    groupInput.querySelector('i').classList.add('fa-check-circle')
  } else {
    groupInput.classList.remove('form__group-correct')
    groupInput.classList.add('form__group-incorrect')
    groupInput.querySelector('i').classList.remove('fa-check-circle')
    groupInput.querySelector('i').classList.add('fa-times-circle')
  }
  return test
}

/**
 * @param {Element} messageContainer
 * @param {Number} seconds
 */
export const showFormSuccessMessage = (messageContainer, seconds) => {
  messageContainer.classList.add('form__success-message-active')
  setTimeout(() => {
    messageContainer.classList.remove('form__success-message-active')
  }, seconds * 1000)
}

/**
 * @param {Element} messageContainer
 * @param {Number} seconds
 */
export const showFormErrorMessage = (messageContainer, message, seconds) => {
  messageContainer.lastChild.textContent = ` ${message}`
  messageContainer.classList.add('form__message-active')
  setTimeout(() => {
    messageContainer.classList.remove('form__message-active')
  }, seconds * 1000)
}

export const clearForm = form => {
  form
    .querySelectorAll('.form__group')
    .forEach(group => group.classList.remove('form__group-correct'))
}
