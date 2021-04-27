import getPage from './functions/getPage.js'
import renderPage from './functions/renderPage.js'
let showingTasks = false
const tasksButtonOC = document.getElementById('tasks__button-oc')
const tasksButtonHome = document.getElementById('tasks__button-home')
const tasks = document.getElementById('tasks')
const pagesContainer = document.getElementById('main')

let currentPage = {
  name: 'index',
  html: '',
  styleLink: {},
  scriptLink: {}
}

const tasksHandler = (tasks, tasksButtonOC, showingTasks) => {
  if (showingTasks) {
    tasksButtonOC.querySelector('i').classList.remove('fa-times')
    tasksButtonOC.querySelector('i').classList.add('fa-tasks')
    tasks.classList.remove('display-block')
    tasks.classList.add('display-none')
  } else {
    tasksButtonOC.querySelector('i').classList.remove('fa-tasks')
    tasksButtonOC.querySelector('i').classList.add('fa-times')
    tasks.classList.remove('display-none')
    tasks.classList.add('display-block')
  }
  return !showingTasks
}

tasksButtonOC.addEventListener('click', () => {
  showingTasks = tasksHandler(tasks, tasksButtonOC, showingTasks)
})

tasksButtonHome.addEventListener('click', () => {
  if (location.hash) {
    location.href = './'
    return
  }
  showingTasks = tasksHandler(tasks, tasksButtonOC, true)
})

tasks.addEventListener('click', async evt => {
  const taskClicked = evt.target.closest('a')
  if (!taskClicked) return
  if (currentPage.name !== 'index') {
    pagesContainer.innerHTML = ''
    currentPage.styleLink.remove()
    currentPage.scriptLink.remove()
  }
  currentPage = await getPage(taskClicked.getAttribute('href'))
  renderPage(currentPage, pagesContainer)
  showingTasks = tasksHandler(tasks, tasksButtonOC, true)
})

addEventListener('DOMContentLoaded', async evt => {
  if (!location.hash) {
    currentPage = await getPage('#cover')
    renderPage(currentPage, pagesContainer)
    return
  }
  const taskLink = location.hash
  const task = [...tasks.querySelectorAll('.task')].find(
    task => task.getAttribute('href') === taskLink
  )
  task ? task.click() : (location.href = './')
})
