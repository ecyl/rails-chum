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
    console.log("An ajax request will be here");
  }
}
