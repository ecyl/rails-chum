import { Controller } from "@hotwired/stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { userId: Number };
  static targets = ["badge"];

  connect() {
    console.log(`Subscribe to the chatroom with the id ${this.userIdValue}.`);
    console.log(this.badgeTarget);

    this.channel = consumer.subscriptions.create(
      {
        channel: "MyNotificationBadgeChannel",
        id: this.userIdValue,
      },

      {
        received: (data) => console.log(data),
      }
    );
  }
}
