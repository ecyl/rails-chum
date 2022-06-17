import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["link", "chatroom"];

  connect() {
    console.log("chatroom summary controller connected")
  }

  displayChat(event) {
    event.preventDefault();

    console.log(event.currentTarget.dataset)
    console.log(this.linkTargets);

    this.linkTargets.forEach((link) => {
      link.classList.remove('active')
    })

    const chatLink = event.currentTarget;
    chatLink.classList.add('active');

    const chatboxId = event.currentTarget.dataset.chatboxId;
    // when a chatbox link is selected, hide all the boxes
    console.log(this.chatroomTargets);

    this.chatroomTargets.forEach((chatroom) => {
      chatroom.classList.remove('active')
    })
    // add an active class to the chatbox with the chatroom id
    const chatroom = document.getElementById(chatboxId)
    chatroom.classList.add('active')
  }
}
