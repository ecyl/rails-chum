import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ["form", "input", "list"];

  connect() {
    // console.log("search itineraries controller is now connected");
    // console.log(this.formTarget);
    // console.log(this.inputTarget);
    // console.log(this.listTarget);
  }

  update(e) {
    // AJAX request to update list based on search query
    const query = `${this.inputTarget.value}`
    const url = `${this.formTarget.action}?query=${query}`
    fetch(url, { headers: { "Accept": "text/plain" } })
    .then(response => response.text())
    .then(data => {
      // console.log(data);
      this.listTarget.outerHTML = data;
    })
  }
}
