import { Controller } from "@hotwired/stimulus"

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
      style: "mapbox://styles/mapbox/streets-v12"
    })

    this.#addMarkersToMap(this.markersValue)
    this.#fitMapToMarkers(this.markersValue)
  }

  #addMarkersToMap() {
    this.#clearMarkers()
    this.mapMarkers = markers.map((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window)

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.className = "marker"
      customMarker.style.backgroundImage = `url('${marker.image_url}')`
      customMarker.style.backgroundSize = "contain"
      customMarker.style.width = "25px"
      customMarker.style.height = "25px"

      // Pass the element as an argument to the new marker
      return new mapboxgl.Marker(customMarker)
        .setLngLat([marker.lng, marker.lat])
        .setPopup(popup)
    })
    this.#refreshMarkers()
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

  #refreshMarkers() {
    this.mapMarkers.forEach(mapMarker => mapMarker.addTo(this.map))
  }

  #clearMarkers() {
    this.mapMarkers.forEach(mapMarker => mapMarker.remove())
  }

  refresh(event) {
    event.preventDefault()
    const filteredMarkers = this.markersValue.filter(marker => marker.id === dog.id)
    this.#addMarkersToMap(filteredMarkers)
  }
}
