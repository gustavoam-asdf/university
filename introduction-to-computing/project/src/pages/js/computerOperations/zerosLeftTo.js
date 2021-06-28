const zerosLeftTo = (length, value) => {
  return `${'0'.repeat(length - value.length)}${value}`
}

export default zerosLeftTo
