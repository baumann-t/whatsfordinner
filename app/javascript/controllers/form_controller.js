import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["formSpace"]

  connect() {
    console.log("connected")
    window.addEventListener("keyup", this.preventEnter)
  }
  disconnect() {
    window.removeEventListener("keyup", this.preventEnter)
  }

  goToNextFormSpace (event) {
    event.preventDefault()
    const currentFormSpacePosition = event.target.getAttribute("data-position")
    const nextFormSpacePosition = parseInt(currentFormSpacePosition) + 1
    const nextFormSpace = this.formSpaceTargets[nextFormSpacePosition]
    nextFormSpace.scrollIntoView()
  }

  goToLastFormSpace (event) {
    event.preventDefault()
    const currentFormSpacePosition = event.target.getAttribute("data-position")
    const nextFormSpacePosition = parseInt(currentFormSpacePosition) - 1
    const nextFormSpace = this.formSpaceTargets[nextFormSpacePosition]
    nextFormSpace.scrollIntoView()
  }

  preventEnter(event) {
    console.log(event.key)
    if (event.key !== "Enter") return
    event.preventDefault()
  }
}
