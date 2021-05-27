import firstDigit from '../pages/js/changeBase/firstDigit.js'


const shiftLogicLeft =(strNumber,bits) =>
{
const digit=firstDigit(strNumber).asText;
const quietdigit=strNumber.slice(1,8);

if(strNumber.length < bits+1)

return{
 number1: `${String(quietdigit)+"0"}`,
}

}
console.log("Shift logico Izquierda")
console.log("10011000");

console.log(shiftLogicLeft("10011000",8));


const shiftCircleLeft=(strNumber,bits)=>
{
const digit=firstDigit(strNumber).asText;
const quietdigit=strNumber.slice(1,bits);

if(strNumber.length < bits+1)

return{
 number1: `${String(quietdigit)+ digit}`,
}

}
console.log("Shift Circular Izquierda");
console.log("10011000")
console.log(shiftCircleLeft("10011000",8))