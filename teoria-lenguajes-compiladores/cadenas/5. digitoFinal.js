const digitoFinal = cadena => {
  if (typeof cadena !== 'string') throw new Error('Cadena debe ser un string')
  if (cadena === '') return ''
  const primerDigito = cadena.slice(0, 1)
  const restoCadena = cadena.slice(1)
  if (primerDigito !== 'a' && primerDigito !== 'b') throw new Error('Caracteres desconocidos')
  if (restoCadena === '') return primerDigito
  return digitoFinal(restoCadena)
}

console.log(digitoFinal(''))
console.log(digitoFinal('a'))
console.log(digitoFinal('babab'))
console.log(digitoFinal('abbbaba'))
console.log(digitoFinal('bbab'))
