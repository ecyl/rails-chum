import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    // console.log("navbar_controller is now connected")
  }

  updateNavbar() {
    // Check if at homepage
    if (window.location.pathname === "/") {
      if (window.scrollY >= window.innerHeight) {
        this.element.classList.add("navbar-chum-black")
      } else {
        this.element.classList.remove("navbar-chum-black")
      }
    }
  }
}
