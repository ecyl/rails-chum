import { Controller } from "@hotwired/stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = {
    chatroomId: Number,
    currentUserId: Number,
  };
  static targets = ["messages", "content"];

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "ChatroomChannel", id: this.chatroomIdValue },
      { received: (data) => this.#insertMessageAndScrollDown(data) }
    );
    console.log(
      `Subscribe to the chatroom with the id ${this.chatroomIdValue}.`
    );

    console.log("This is my current user id", this.currentUserIdValue);
  }

  resetForm(event) {
    event.target.reset();
  }

  #insertMessageAndScrollDown(data) {
    console.log(data);
    // Create an element
    // Insert the HTML on the element (from data)
    this.messagesTarget.insertAdjacentHTML("beforeend", data);
    const currentMessage = this.messagesTarget.lastElementChild;
    console.log("Sender Id", currentMessage.dataset.senderId);
    console.log("Current Id", this.currentUserIdValue);
    if (currentMessage.dataset.senderId == this.currentUserIdValue) {
      currentMessage.classList.add("message-sender");
    } else {
      currentMessage.classList.remove("message-sender");
    }
    // Add/remove message-sender class based on current user info

    // Remove message-sender-class from the element, if current user is the same user as the sender
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight);

    this.contentTarget.classList.add('active')
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom");
    this.channel.unsubscribe();
  }
}
