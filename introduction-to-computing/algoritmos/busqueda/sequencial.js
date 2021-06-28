const busquedaSecuencial = (elements, searchedElement) => {
  for (let i = 0; i < elements.length; i++) {
    if (elements[i] == searchedElement) {
      return { element: elements[i], position: i }
    }
  }
  return { position: -1 }
}

const alumns = ['Diego', 'Favio', 'Carlos', 'Gustavo']
const searchedAlumn = 'Favio'

console.log(busquedaSecuencial(alumns, searchedAlumn))
