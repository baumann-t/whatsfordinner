import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["submit", "count", "remove"]
  static values = {recipe: Number}

  connect() {
  }

  vote(event) {
    event.preventDefault()
    const url = `/recipes/${this.recipeValue}/upvotes`
    fetch(url, {headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }})
    .then(response => response.json())
    .then((data) => {
      let string = ""
      if (data["upvote_count"] === 0) {
        string = `${data["upvote_count"]} like`
      } else if (data["upvote_count"] === 1){
        string = `${data["upvote_count"]} like`
      } else {
        string = `${data["upvote_count"]} likes`
      }
      this.countTarget.innerHTML = string
      this.submitTarget.style.display = "none";
      this.removeTarget.style.display = "unset";
    })
  }

  unvote(event) {
    event.preventDefault()
    const url = `/recipes/${this.recipeValue}/upvotes`
    fetch(url, {
      method: "DELETE",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() },
    })
    .then(response => response.json())
    .then((data) => {
      let string = ""
      if (data["upvote_count"] === 0) {
        string = `${data["upvote_count"]} like`
      } else if (data["upvote_count"] === 1){
        string = `${data["upvote_count"]} like`
      } else {
        string = `${data["upvote_count"]} likes`
      }
      this.countTarget.innerHTML = string
      this.submitTarget.style.display = "unset";
      this.removeTarget.style.display = "none";
    })
  }
}
