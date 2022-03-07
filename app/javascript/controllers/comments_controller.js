import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["list", "form", "input", "field", "id"]
  static values = {recipe: Number, userecipe: Number}

  add(event) {
    event.preventDefault()
    const url = `/cookbook/${this.userecipeValue}/comments`

    fetch(url, {
      method: "POST",
      headers: { "Accept": "text/plain", "X-CSRF-Token": csrfToken() },
      body: new FormData(this.inputTarget)
    })
    .then(response => response.text())
    .then((data) => {
      this.listTarget.insertAdjacentHTML('beforeend', data)
      this.fieldTarget.value = ' '
      window.scrollTo(0,document.body.scrollHeight);
    })
  }

  delete(event) {
    event.preventDefault()
    console.log(this.idTarget.innerHTML);
    const url= `/cookbook/${this.userecipeValue}/comments/${this.idTarget.innerHTML}`

    fetch(url, {
      method: "DELETE",
      headers: { "Accept": "application/json", "X-CSRF-Token": csrfToken() }
    })
    .then(response => response.json())
    .then((data) => {
      const comment = `${data.delete}-comment`
      const hr = `${data.delete}-hr`
      const elementComment = document.getElementById(comment)
      const hrComment = document.getElementById(hr)
      elementComment.remove()
      hrComment.remove()
      window.scrollTo(0,document.body.scrollHeight);
    })
  }

}
