const renderPage = (page, pageContainer) => {
  pageContainer.innerHTML = page.html
  setTimeout(() => {
    document.body.append(page.scriptLink)
  }, 0)
}

export default renderPage
