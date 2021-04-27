import createCSSLink from './functions/createCSSLink.js'

class Preloader extends HTMLElement {
  constructor() {
    super()
    this.styleLink = createCSSLink('./styles/preloader.css')
  }

  connectedCallback() {
    this.classList.add('preloader__overlay')
    this.innerHTML = '<div class="preloader"></div>'
  }
}

customElements.define('pre-loader', Preloader)
