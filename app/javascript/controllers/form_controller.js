import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["formSpace"]

  connect() {
  }

  goToNextFormSpace (event) {
    event.preventDefault()
    const currentFormSpacePosition = event.target.getAttribute("data-position")
    const nextFormSpacePosition = parseInt(currentFormSpacePosition) + 1
    const nextFormSpace = this.formSpaceTargets[nextFormSpacePosition]
    nextFormSpace.scrollIntoView()
  }
}
