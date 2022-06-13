import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static targets = ["card"];
  connect() {
    console.log("itinerary card controller is connected");
  }

  clickCard() {
    console.log(this.cardTarget);
    const card = this.cardTarget;
    const itineraryId = card.dataset['itineraryId'];
    window.location.href = `itineraries/${itineraryId}`;
  }
}
