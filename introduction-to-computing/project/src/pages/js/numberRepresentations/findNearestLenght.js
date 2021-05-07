const findNearestLenght = (numberLength, base, exp = 0) => {
  if (typeof numberLength !== 'number') throw new TypeError('Number length must be a number')
  if (base ** exp >= numberLength) return base ** exp
  return findNearestLenght(numberLength, base, ++exp)
}

export default findNearestLenght
