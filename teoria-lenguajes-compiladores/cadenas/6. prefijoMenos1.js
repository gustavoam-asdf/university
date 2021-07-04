const prefijoLongitudMenos1 = cadena => {
  if (typeof cadena !== 'string') throw new Error('Cadena debe ser un string')
  if (cadena === '') return ''
  const primerDigito = cadena.slice(0, 1)
  const restoCadena = cadena.slice(1)
  if (primerDigito !== 'a' && primerDigito !== 'b') throw new Error('Caracteres desconocidos')
  if (restoCadena === '') return ''
  return `${primerDigito}${prefijoLongitudMenos1(restoCadena)}`
}

console.log(prefijoLongitudMenos1(''))
console.log(prefijoLongitudMenos1('a'))
console.log(prefijoLongitudMenos1('babab'))
console.log(prefijoLongitudMenos1('abbbab'))
console.log(prefijoLongitudMenos1('bbab'))
