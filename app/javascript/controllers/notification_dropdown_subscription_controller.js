import { Controller } from "@hotwired/stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static values = { userId: Number };
  static targets = ["row", "eachrow"];

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
        received: (data) => {
          console.log("I have received the data from the broadcast");
          console.log(data);
          this.#insertNotificationAndScrollUp(data);
        },
      }
    );

    console.log("I am still connected");
    console.log(this.rowTarget);
    console.log(this.channel);
  }

  #insertNotificationAndScrollUp(data) {
    console.log("Here's the data that I am receiving. Check it out");
    console.log(data);
    this.rowTarget.insertAdjacentHTML("afterbegin", data);
  }
}
