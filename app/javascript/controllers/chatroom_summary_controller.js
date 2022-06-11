import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["results"]

  connect() {
    console.log("chatroom summary controller connected")
  }

  insertChatNames() {
    const chatTag= `<li> <%= ${chatroom.name} %> </li>`
    this.resultsTarget.insertAdjacentHTML("beforeend", chatTag)
  }

}
