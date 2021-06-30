import {
  clearForm,
  drawInputInfo,
  showFormErrorMessage,
  showFormSuccessMessage
} from '../../js/formHandler/drawInfo.js'
import applyEventsForm from '../../js/formHandler/applyEventsForm.js'
import { busquedaBinaria } from './algoritmos/busqueda/binaria.js'
import { busquedaSecuencial } from './algoritmos/busqueda/sequencial.js'
import { hash } from './algoritmos/busqueda/hashTable.js'
const busquedabinary = document.getElementById('busqueda_binary')
const busquedasequence = document.getElementById('busqueda_sequence')
const busquedahashtable = document.getElementById('busqueda_hashtable')

const btnagregarbinary = document.getElementById('add_digit_binary')
const btnagregarsequence = document.getElementById('add_digit_sequence')
const btnagregarhashtable = document.getElementById('add_digit_hashtable')

const mostrararreglobinary = document.getElementById('show__array_resultbinary')
const mostrararreglosequence = document.getElementById('show__array_resultsequence')
const mostrararreglohashtable = document.getElementById('show__array_resulthashtable')

let arreglo = Array()
let arreglo1 = Array()
let arreglo2 = Array()

const isString = strNumber => {
  const temp = strNumber.toString()
  return temp.search(/^[a-zA-ZÀ-ÿ\s]{1,40}$/) !== -1
}
//Busqueda Binaria //
btnagregarbinary.addEventListener('click', evt => {
  evt.preventDefault()
  let dato = document.getElementById('digit_Array_binary').value

  if (!isString(dato)) arreglo.push(dato)

  mostrararreglobinary.value = arreglo
})

busquedabinary.addEventListener('submit', evt => {
  evt.preventDefault()

  let buscarvalor = document.getElementById('valor_buscar').value

  const result = document.getElementById('result_ordinance_binary')

  let numero = busquedaBinaria(arreglo, buscarvalor)

  result.value = numero
})
//Busqueda Sequencial//

btnagregarsequence.addEventListener('click', evt => {
  evt.preventDefault()
  let dato = document.getElementById('digit_Array_sequence').value

  arreglo1.push(dato)

  mostrararreglosequence.value = arreglo1
})

busquedasequence.addEventListener('submit', evt => {
  evt.preventDefault()

  let buscarvalor = document.getElementById('valor_buscar1').value
  const result = document.getElementById('result_ordinance_sequence')

  let valor = busquedaSecuencial(arreglo1, buscarvalor)

  result.value = JSON.stringify(valor)
})

//Busqueda HashTable//

btnagregarhashtable.addEventListener('click', evt => {
  evt.preventDefault()

  let dato = document.getElementById('digit_Array_hashtable').value
  arreglo2.push(dato)

  mostrararreglohashtable.value = arreglo2
})

busquedahashtable.addEventListener('submit', evt => {
  evt.preventDefault()
  const result = document.getElementById('result_ordinance_hashtable')
  const table = {}

  const alumns = [
    {
      nombre: 'Pedro',
      matricula: '2017020230'
    },
    {
      nombre: 'Luis',
      matricula: '2020145621'
    },
    {
      nombre: 'Juan',
      matricula: '2021256275'
    },
    {
      nombre: 'Andres',
      matricula: '2021256245'
    }
  ]

  for (let i = 0; i < alumns.length; i++) {
    table[hash(alumns[i])] = alumns[i]
  }
  result.value = JSON.stringify(table)
})
