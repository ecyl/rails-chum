import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/germainewongg/cl4gtrdh7000915p8i75yawqz"
    })
    this.#addMarkersToMap();
    this.#fitMapToMarkers();
    this.#addNavigationControl();
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker({
        color: '#4120BC',
        draggable: false,
        anchor: 'center'
      })
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 1000 })
  }

  #addNavigationControl() {
    const nav = new mapboxgl.NavigationControl({
      showCompass: true,
      showZoom: true
    });
    this.map.addControl(nav, 'top-right');
  }
}
