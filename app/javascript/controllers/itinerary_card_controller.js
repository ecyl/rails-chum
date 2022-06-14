import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static targets = ["card"];
  connect() {
    console.log("itinerary card controller is connected");
  }

  clickCard(e) {
    e.preventDefault()
    const card = e.currentTarget
    const itineraryId = card.dataset['itineraryId'];
    // console.log(`itineraries/${itineraryId}`);
    window.location.href = `itineraries/${itineraryId}`;
  }
}
