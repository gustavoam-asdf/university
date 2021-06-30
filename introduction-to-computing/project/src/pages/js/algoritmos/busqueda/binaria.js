 export function busquedaBinaria(arr, busqueda) {
  const puntoMedio = Math.floor(arr.length / 2)

  if (arr[puntoMedio] === busqueda) {
    return arr[puntoMedio]
  }

  if (arr[puntoMedio] < busqueda && arr.length > 1) {
    return busquedaBinaria(arr.slice(puntoMedio), busqueda)
  }

  if (arr[puntoMedio] > busqueda && arr.length > 1) {
    return busquedaBinaria(arr.slice(0, puntoMedio), busqueda)
  }

  return 'no encontrado :('
}

let a = busquedaBinaria([100, 200, 300, 400, 500, 600, 700], 400)

console.log(a)
