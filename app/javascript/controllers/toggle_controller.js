import { Controller } from "@hotwired/stimulus";
import { csrfToken } from "@rails/ujs";

export default class extends Controller {
  static targets = ["switch", "label"];
  static values = { itineraryId: Number };

  connect() {
    console.log(this.switchTarget.checked);
    console.log(this.labelTarget);
    console.log(this.itineraryIdValue);
  }

  toggle() {
    if (this.switchTarget.checked) {
      // if target.checked -> send AJAX request to publish + remove classlist
      this.labelTarget.classList.remove("label-opaque");
      const url = `/itineraries/${this.itineraryIdValue}/publish`;
      const options = {
        method: "PATCH",
        headers: { Accept: "application/json", "X-CSRF-Token": csrfToken() },
        body: "",
      };
      fetch(url, options)
        .then((response) => response.text())
        .then((data) => console.log("published"));
    } else {
      this.labelTarget.classList.add("label-opaque");
      // else -> send AJAX request to unpublish + add classlist
      const url = `/itineraries/${this.itineraryIdValue}/unpublish`;
      const options = {
        method: "PATCH",
        headers: { Accept: "application/json", "X-CSRF-Token": csrfToken() },
        body: "",
      };
      fetch(url, options)
        .then((response) => response.text())
        .then((data) => console.log("unpublished"));
    }
  }
}
