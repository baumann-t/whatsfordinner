import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["desc"]

  connect() {
    console.log("connected")
  }

  prevent (event) {
    console.log(this.descriptionTarget)
    event.preventDefault()
    this.descriptionTarget.scrollIntoView()

  }
}
