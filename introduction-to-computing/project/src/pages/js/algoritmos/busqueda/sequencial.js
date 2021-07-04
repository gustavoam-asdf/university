export const busquedaSecuencial = (elements, searchedElement) => {
  
  for (let i = 0; i < elements.length ; i++) {
    if (elements[i] == searchedElement) {
      return { elemento:elements[i], position: i }
    }
  }

  return { position: -1 }
}

