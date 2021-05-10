const numeroAs = cadena => {
  if (typeof cadena !== 'string') throw new Error('Cadena debe ser un string')
  if (cadena === '') return 0
  const primerDigito = cadena.slice(0, 1)
  const restoCadena = cadena.slice(1)
  if (primerDigito !== 'a' && primerDigito !== 'b') throw new Error('Caracteres desconocidos')
  if (primerDigito === 'b') return numeroAs(restoCadena)
  return 1 + numeroAs(restoCadena)
}

console.log(numeroAs(''))
console.log(numeroAs('a'))
console.log(numeroAs('abaab'))
console.log(numeroAs('abbbab'))
console.log(numeroAs('bbab'))
