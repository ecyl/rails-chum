import { Controller } from "@hotwired/stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = {
    userId: Number,
  };
  static targets = ["notifications"];

  connect() {
    console.log(consumer);
    this.channel = consumer.subscriptions.create(
      {
        channel: "NotificationChannel",
        id: this.userIdValue,
      },
      { received: (data) => console.log(data) }
    );
    console.log(
      `Subscribe to the notification page with for user ${this.userIdValue}`
    );
    console.log(this.channel);
  }
}
