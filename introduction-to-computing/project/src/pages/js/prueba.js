/*const cubitos = document.getElementById('cubitos');
const fragment = document.createDocumentFragment();
myArray.forEach((num) => {
    const selectinput = document.createElement('input');
    selectinput.setAttribute('disabled','')
    selectinput.setAttribute('value',num);   
    selectinput.setAttribute('class','cuadro')
    selectinput.textContent = num;
    fragment.appendChild(selectinput);
});

 cubitos.appendChild(fragment)

 */
//var expresionRegular = /[\d\,\d]+/;
 //var expresionSimple = /\d*/;
//--------------------------------B I N A R I A-------------------------------------------//
function convertir(){
    var numerointroducido = document.getElementById('numero').value;
    const numerosimple = Number(document.getElementById('numsearch').value);
    var matriz = numerointroducido.split(',').map(Number);
    busquedaBinaria(matriz,numerosimple);
}
 
const busquedaBinaria = (myArray,buscar) => {
    
  const puntoMedio = Math.floor(myArray.length / 2)
  var result = '';  

  if (myArray[puntoMedio] === buscar) {
    result = myArray[puntoMedio];
  }

  if (myArray[puntoMedio] < buscar && myArray.length > 1) {
     result=busquedaBinaria(myArray.slice(puntoMedio), buscar)
  }

  if (myArray[puntoMedio] > buscar && myArray.length > 1) {
    result = busquedaBinaria(myArray.slice(0, puntoMedio), buscar)
  }
  if(buscar != result){
      result = 'No se encontró :('
  }
  return document.getElementById('result').value = result; 
}
//-------------------------------H A S H T A B L E--------------------------------------------//
function agregar(){
    
    var arreglointroducido = '['+document.getElementById('miarreglo').value+']';
    var matriz = JSON.parse(arreglointroducido);

    const table={}
    for (let i = 0; i < matriz.length; i++) {
        table[hash(matriz[i])] = matriz[i]
    }
    console.log(table);
    return document.getElementById('result1').value = JSON.stringify(table); 
}
/* 
  FUENTE : http://json.parser.online.fr
{
    "nombre": "Pedro",
    "matricula": "2017020230"
  },
  {
    "nombre": "Luis",
    "matricula": "2020145621"
  },                              
  {
    "nombre": "Juan",
    "matricula": "2021256275"
  },
  {
    "nombre": "Andres",
    "matricula": "2021256245"
  }
 */

const hash = (array) => {
    const lastDigits = Number(array.matricula.slice(-2))
    return Math.floor(lastDigits / 2)
  }
//--------------------------------S E C U E N C I A L---------------------------------------------//



function buscar(){
    var arreglointroducido = document.getElementById('numero').value;
    const datosimple = document.getElementById('numsearch').value;
    var matriz = arreglointroducido.split(',');
    busquedaSecuencial(matriz,datosimple);
}

const busquedaSecuencial = (elements, searchedElement) => {
    var resultado = ''
    for (let i = 0; i < elements.length; i++) {
      if (elements[i] == searchedElement) {
        
        resultado = Object.entries({ element: elements[i],position: i })
   
      }else{
          resultado = Object.entries({ position: -1 })}
         
    }

    return document.getElementById('result').value = resultado;
  }
  
 
  