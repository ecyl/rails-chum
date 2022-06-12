import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = []

  connect() {
    console.log("insert announcements controller now connected");
  }
}
