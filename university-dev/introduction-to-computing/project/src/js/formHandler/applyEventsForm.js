/**
 * @param {Element} form
 * @param {Function} inputEventHandler
 */
const applyEventsForm = (form, inputEventHandler) => {
  form.addEventListener('keyup', inputEventHandler)
  form.addEventListener('keydown', inputEventHandler)
  form.addEventListener('blur', inputEventHandler)
  form.addEventListener('focus', inputEventHandler)
  form.addEventListener('change', inputEventHandler)
  form.addEventListener('paste', inputEventHandler)
  form.addEventListener('click', inputEventHandler)
}

export default applyEventsForm
