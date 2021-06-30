export const OrdenamientoBurbuja = (array, tam) => {
  tam=array.length;
  let temp=0
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


