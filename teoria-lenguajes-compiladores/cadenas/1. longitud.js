const longitud = cadena => {
  if (typeof cadena !== 'string') throw new Error('Cadena debe ser un string')
  if (cadena === '') return 0
  const primerDigito = cadena.slice(0, 1)
  const restoCadena = cadena.slice(1)
  if (primerDigito !== 'a' && primerDigito !== 'b') throw new Error('Caracteres desconocidos')
  return 1 + longitud(restoCadena)
}

console.log(longitud('aaa'))
console.log(longitud('abaab'))
console.log(longitud('abbbab'))
console.log(longitud('bbab'))
