import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["list", "form", "input", "field", "intro"]
  static values = {recipe: Number, userecipe: Number}

  add(event) {
    event.preventDefault()
    const url = `/cookbook/${this.userecipeValue}/comments`

    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.inputTarget)
    })
    .then(response => response.json())
    .then((data) => {
      this.listTarget.insertAdjacentHTML('beforeend', data.comment)
      this.fieldTarget.value = ' '
      this.introTarget.innerHTML = "Comments:"
    })
  }

}
