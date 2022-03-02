import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["list", "input"]
  static values = {recipe: Number}

  add(event) {
    event.preventDefault()
    const url = `/recipes/${this.recipeValue}/comments`

    fetch(url, {
      method: "POST",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.inputTarget)
    })
    .then(response => response.json())
    .then((data) => {
      if (data.inserted_item) {
        this.listTarget.insertAdjacentHTML("beforeend", data.inserted_item)
      }
    })
  }

}
