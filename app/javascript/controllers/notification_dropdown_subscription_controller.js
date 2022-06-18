import { Controller } from "@hotwired/stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { userId: Number };
  static targets = ["row"];

  connect() {
    console.log(
      `Subscribe to the notification dropdown with the id ${this.userIdValue}.`
    );

    this.channel = consumer.subscriptions.create(
      {
        channel: "NotificationDropdownChannel",
        id: this.userIdValue,
      },
      {
        received: (data) => this.#insertNotificationAndScrollUp(data),
      }
    );

    console.log("I am still connected");
    console.log(this.rowTarget);
  }

  #insertNotificationAndScrollUp(data) {
    this.rowTarget.insertAdjacentHTML("afterbegin", data);
  }
}
