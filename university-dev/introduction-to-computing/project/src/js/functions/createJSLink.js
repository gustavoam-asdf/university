const createJSLink = src => {
  const script = document.createElement('script')
  script.setAttribute('type', 'module')
  script.setAttribute('src', `${src}?v=${new Date().getTime()}`)
  return script
}

export default createJSLink
