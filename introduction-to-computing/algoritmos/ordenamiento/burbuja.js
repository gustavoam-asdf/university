const OrdenamientoBurbuja = (array, tam) => {
  for (let i = 1; i < tam; i++) {
    for (let j = 0; j < tam - 1; j++) {
      if (array[j] > array[j + 1]) {
        temp = array[j]
        array[j] = array[j + 1]
        array[j + 1] = temp
      }
    }
  }

  return array
}

const inputArray = [4, 3, 5, 2, 1]

const OutArray1 = OrdenamientoBurbuja(inputArray, inputArray.length)

console.log(OutArray1)
