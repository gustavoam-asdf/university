// 1: es vacio
// 0: no es vacio

const esVacio = cadena => {
  if (typeof cadena !== 'string') throw new Error('Cadena debe ser un string')
  if (cadena === '') return 1
  const primerDigito = cadena.slice(0, 1)
  if (primerDigito !== 'a' && primerDigito !== 'b') throw new Error('Caracteres desconocidos')
  return 0
}

console.log(esVacio(''))
console.log(esVacio('a'))
console.log(esVacio('abaab'))
console.log(esVacio('abbbab'))
console.log(esVacio('bbab'))
console.log(esVacio(''))
