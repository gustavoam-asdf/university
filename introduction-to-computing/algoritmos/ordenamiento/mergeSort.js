const Merging = (array, inicio, medio, final) => {
  let ini1, ini2, index, temp

  for (ini1 = inicio, ini2 = medio + 1, index = inicio; ini1 <= medio && ini2 <= final; index++) {
    if (array[ini1] <= array[ini2]) {
      temp[i] = array[ini1++]
    } else {
      temp[i] = array[ini2++]
    }
  }

  while (ini1 <= medio) {
    temp[index++] = array[ini1++]
  }

  while (ini2 <= fin) {
    temp[index++] = array[ini2++]
  }

  for (index = inicial; index <= final; i++) {
    array[index] = temp[index]
  }
}

const OrdenamientoMergesort = (array, inicio, final) => {
  let medio

  if (inicio < final) {
    medio = (inicio + final) / 2
    OrdenamientoMergesort(array, inicio, medio)
    OrdenamientoMergesort(array, medio + 1, final)
    Merging(array, inicio, medio, final)
  }

  return array
}

const inputArray = [4, 3, 5, 2, 1]

const OutArray = OrdenamientoMergesort(inputArray, 1, 5)
console.log(OutArray)
