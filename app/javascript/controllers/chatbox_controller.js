import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["link"];

  connect() {
    console.log("chatroom summary controller connected")
  }

  show(event) {
    console.log(this.linkTarget)
  }
}
