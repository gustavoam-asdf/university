// <<<<<<< HEAD
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
// =======
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
// >>>>>>> 5be8d0e8b1efe9b2b81a37fa7b9fb7da4aa6222c
