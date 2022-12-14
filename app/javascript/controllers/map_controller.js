import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  mapMarkers = []

  connect() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
    container: this.element,
    style: "mapbox://styles/mapbox/streets-v12",
    center: [-73.561668, 45.508888],
    zoom: 1
    });
    this.#addMarkersToMap(this.markersValue)
    this.#fitMapToMarkers(this.markersValue)
  }

  #addMarkersToMap(markers) {
    this.#clearMarkers()
    this.mapMarkers = markers.map((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "35px"
      customMarker.style.height = "35px"

      // Pass the element as an argument to the new marker
      return new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
      })
      this.#refreshMarkers()
  }

  #refreshMarkers() {
    this.mapMarkers.forEach(mapMarker => mapMarker.addTo(this.map))
  }

  #fitMapToMarkers(markers) {
    const bounds = new mapboxgl.LngLatBounds()
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 8, duration: 0 })
  }

  refresh(event) {
    event.preventDefault()
    const filteredMarkers = this.markersValue.filter(marker => marker.id)
    this.#addMarkersToMap(filteredMarkers)
  }

  #clearMarkers() {
    this.mapMarkers.forEach(mapMarker => mapMarker.remove())
  }
}
