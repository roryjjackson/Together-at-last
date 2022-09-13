import { Controller } from "@hotwired/stimulus"

let mapLat = 0
let mapLng = 0
const key = 'pk.eyJ1IjoieWFubXRzZTIiLCJhIjoiY2w2cWh3cmI5MGFlcTNqbjJtendxeHo2diJ9.xcu8WnTfctYSgtzcvIPaZw'

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    let titles = document.querySelectorAll('#card-title');

    titles.forEach (node => node.addEventListener('click', (e) => {

      let address = e.currentTarget.childNodes[5].innerText

      fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${key}`)
      .then(response => response.json())
      .then(data => mapLng = data.features[0].center[1]);

      fetch(`https://api.mapbox.com/geocoding/v5/mapbox.places/${address}.json?access_token=${key}`)
      .then(response => response.json())
      .then(data => mapLat = data.features[0].center[0]);

      setTimeout(() =>
        this.map.fitBounds([
          [mapLat + 0.003, mapLng + 0.0003], // northeastern corner of the bounds
          [mapLat - 0.003, mapLng - 0.0003], // southwestern corner of the bounds
        ])
      , 500)

      }
    ))

    // const modalMap = this.map;

    // const resizeMap = () => {
    //   modalMap.resize();
    // }

    // setInterval(resizeMap, 100);

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      new mapboxgl.Marker()
        .setLngLat([ marker.lng, marker.lat ])
        .addTo(this.map)
    })

  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }

}
