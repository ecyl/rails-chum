import { Controller } from "@hotwired/stimulus";
import consumer from "../channels/consumer";

export default class extends Controller {
  static targets = ["switch", "label"];

  connect() {
    console.log(this.switchTarget.checked);
    console.log(this.labelTarget);
  }

  toggle() {
    if (this.switchTarget.checked) {
      // if target.checked -> send AJAX request to publish + remove classlist
      this.labelTarget.classList.remove("label-opaque");
    } else {
      this.labelTarget.classList.add("label-opaque");
      // else -> send AJAX request to unpublish + add classlist
    }
  }
}
