import firstDigit from '../pages/js/changeBase/firstDigit.js'

   const shiftRight =(strNumber,bits) =>
    {
   const digit=firstDigit(strNumber).asText;
   const quietdigit=strNumber.slice(0,bits-1);

   if(strNumber.length < bits+1)
   
  return{
     number1: `${digit +String(quietdigit)}`,
  }
  
    }
    console.log("Shift aritmetica derecha")
    console.log("10011001");
    console.log(shiftRight("10011001",8));



 
   const shiftLeft= (strNumber,bits) =>
    {
   
   const quietdigit=strNumber.slice(1,bits);

   if(strNumber.length < bits+1)
   
  return{
     number1: `${String(quietdigit)+"0"}`,
  }

  
    }
    console.log("Shift aritmetica izquierda")
    console.log("11011001");
   console.log(shiftLeft("11011001",8));

