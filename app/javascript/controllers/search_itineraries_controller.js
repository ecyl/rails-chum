import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ["form", "destinationInput", "list", "startDateInput"];

  connect() {
    console.log("search itineraries controller is now connected");
    // console.log(this.formTarget);
    // console.log(this.destinationInputTarget);
    // console.log(this.listTarget);
    console.log(this.startDateInputTarget);
  }

  // update(e) {
  //   // AJAX request to update list based on search query
  //   const destinationQuery = `${this.destinationInputTarget.value}`
  //   // const startDateQuery = `${this.startDateInputTarget.value}`
  //   const url = `${this.formTarget.action}?query=${destinationQuery}`
  //   fetch(url, { headers: { "Accept": "text/plain" } })
  //   .then(response => response.text())
  //   .then(data => {
  //     // console.log(data);
  //     this.listTarget.outerHTML = data;
  //   })
  // }
}
