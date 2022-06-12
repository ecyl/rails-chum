import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["address"]
  connect() {
    console.log("Modal controller is connected")
  }

  getAddress() {
    console.log(this.addressTarget)
    const coordinates = this.addressTarget.dataset['addressInfo'];
    const splitCoordinates = coordinates.split(/[\[\],]/);
    const latitude = splitCoordinates[1];
    const longitude = splitCoordinates[2];
    const endpoint = 'mapbox.places';

    // Reverse geocode using mapbox
    const url = `https://api.mapbox.com/geocoding/v5/${endpoint}/${longitude},${latitude}.json?access_token=pk.eyJ1IjoiZ2VybWFpbmV3b25nZyIsImEiOiJjbDM4Y29vMngwMDlvM2ltZ3Eza3A0ano4In0.pI8jmt7xFxWsty2RwV2XLw`;
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        const placeName = data.features[1].place_name;
        document.querySelector("#location-address").innerHTML = `${placeName}`;
      })
  }
}
