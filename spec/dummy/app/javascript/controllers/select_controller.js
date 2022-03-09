import { Controller } from "@hotwired/stimulus"
import SlimSelect from "slim-select"

export default class extends Controller {
  static values = { url: String }

  connect() {
    // set basic options
    let options = { 
      select: this.element,
      allowDeselect: true
    }

    // check if url is present -> fetch via ajax
    if (this.hasUrlValue) {
      let _this = this
      options.ajax = function (search, callback) {
        if (search.length < 3) {
          callback('Bitte geben Sie mind. 3 Buchstaben ein...')
          return
        }

        let url = new URL(_this.urlValue)
        url.search = new URLSearchParams({ q: search })

        fetch(url)
          .then(response => response.json())
          .then(json => callback(json))
          .catch(error => callback(error))
      }
    }

    new SlimSelect(options)
  }
}
