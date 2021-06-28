const hash = alumn => {
  const lastDigits = Number(alumn.matricula.slice(-2))
  return Math.floor(lastDigits / 2)
}

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

const table = {}

for (let i = 0; i < alumns.length; i++) {
  table[hash(alumns[i])] = alumns[i]
}

console.log(table)

debugger
