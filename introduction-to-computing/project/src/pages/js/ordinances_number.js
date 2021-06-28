import {
  clearForm,
  drawInputInfo,
  showFormErrorMessage,
  showFormSuccessMessage
} from '../../js/formHandler/drawInfo.js'
import applyEventsForm from '../../js/formHandler/applyEventsForm.js'

import {
  OrdenamientoBurbuja
} from '../../../../algoritmos/ordenamiento/burbuja.js'

import {
  mergeSort
} from '../../../../algoritmos/ordenamiento/mergeSort.js'

import {
  BinaryTree
} from '../../../../algoritmos/ordenamiento/binaryTree.js'

const metodoburbuja = document.getElementById('metodo_burbuja_form')
const metodoquicksort = document.getElementById('metodo_quicksort_form')
const metodomergezort = document.getElementById('metodo_mergezort_form')
const metodobinarytree = document.getElementById('metodo_binary_form')

const btnagregarquicksort = document.getElementById('add_digit_quicksort')
const btnagregarburbuja = document.getElementById('add_digit_burbuja')
const btnagregarmergezort = document.getElementById('add_digit_mergezort')
const btnagregarbinary = document.getElementById('add_digit_binary');

const mostrararregloburbuja = document.getElementById('show__array_resultbubble')
const mostrararregloquicksort = document.getElementById('show__array_resultquicksort')
const mostrararreglomergezort = document.getElementById('show__array_resultmergezort')
const mostrararreglobinary = document.getElementById('show__array_resultbinarytree')

let datos = Array();
let datos1 = Array();
let datos2 = Array();
let datos3 = Array();

const formverifier = {
  
}

//METODO QUICKSORT//

btnagregarquicksort.addEventListener('click', evt => {
  evt.preventDefault()

  let dato = document.getElementById('digit_Array_quicksort').value;
  if (!isString(dato))
    datos1.push(dato);
  mostrararregloquicksort.value = datos1;
})

metodoquicksort.addEventListener('submit', evt => {
  evt.preventDefault()
  const result = document.getElementById('result_ordinance_quicksort')

  result.value = datos1.sort((x, y) => x - y);

})


const isString = strNumber => {
  const temp = strNumber.toString()
  return temp.search(/^[a-zA-ZÀ-ÿ\s]{1,40}$/) !== -1
}

//METODO DE BURBUJA//
btnagregarburbuja.addEventListener('click', evt => {
  evt.preventDefault()

  let dato = document.getElementById('digit_Array_burbuja').value;
  if (!isString(dato))
    datos.push(dato);
  mostrararregloburbuja.value = datos;

})

metodoburbuja.addEventListener('submit', evt => {
  evt.preventDefault()
  const result = document.getElementById('result_ordinance_bubble')
  result.value = OrdenamientoBurbuja(datos);
})

//METODO MERGEZORT//

btnagregarmergezort.addEventListener('click', evt => {
  evt.preventDefault()

  let dato = document.getElementById('digit_Array_mergezort').value;
  if (!isString(dato))
  
  datos2.push(dato);  
    
  mostrararreglomergezort.value = datos2;

})


metodomergezort.addEventListener('submit', evt => {

  evt.preventDefault()
  const result = document.getElementById('result_ordinance_mergezort')

  result.value = mergeSort(datos2)

});



//METODO BINARY//

btnagregarbinary.addEventListener('click', evt => {
  evt.preventDefault()

  let dato = document.getElementById('digit_Array_binary').value;
  if (!isString(dato))
    datos3.push(dato);
  mostrararreglobinary.value = datos3;

})


metodobinarytree.addEventListener('submit', evt => {

  evt.preventDefault()
  const result = document.getElementById('result_ordinance_binary')

  let tree = new BinaryTree()

  for (let i = 0; i < datos3.length; i++) {
    tree.add(datos3[i])
  }
  tree.print()

  result.value = tree.getnode()
});