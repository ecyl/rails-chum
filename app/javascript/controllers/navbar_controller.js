import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // console.log("navbar_controller is now connected")
  }

  updateNavbar() {
    // Check if at homepage
    if (!this.element.classList.contains('static') ) {
      if (window.scrollY >= window.innerHeight) {
        this.element.classList.add("navbar-chum-white")
      } else {
        this.element.classList.remove("navbar-chum-white")
      }
    }
  }
}
