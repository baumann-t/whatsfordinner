import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["submit", "count"]
  static values = {recipe: Number}

  connect() {
  }

  vote(event) {
    event.preventDefault()
    const url = `/recipes/${this.recipeValue}/upvotes`
    fetch(url, {headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }})
    .then(response => response.json())
    .then((data) => {
      this.countTarget.innerHTML = `${data["upvote_count"]} upvotes`
      this.submitTarget.style.visibility = 'hidden'
    })

  }
}
