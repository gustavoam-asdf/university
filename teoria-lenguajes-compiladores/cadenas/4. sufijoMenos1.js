const sufijoLongitudMenos1 = cadena => {
  if (typeof cadena !== 'string') throw new Error('Cadena debe ser un string')
  if (cadena === '') return ''
  const primerDigito = cadena.slice(0, 1)
  const restoCadena = cadena.slice(1)
  if (primerDigito !== 'a' && primerDigito !== 'b') throw new Error('Caracteres desconocidos')
  return restoCadena
}

console.log(sufijoLongitudMenos1(''))
console.log(sufijoLongitudMenos1('a'))
console.log(sufijoLongitudMenos1('babab'))
console.log(sufijoLongitudMenos1('abbbab'))
console.log(sufijoLongitudMenos1('bbab'))
