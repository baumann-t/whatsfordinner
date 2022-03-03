import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["desc","prep","instructions","ingredients","category","photo"]

  connect() {
    console.log("connected")
  }

  preventDesc (event) {
    console.log(this.descTarget)
    event.preventDefault()
    this.descTarget.scrollIntoView()
  }

  preventPrep (event) {
    console.log(this.prepTarget)
    event.preventDefault()
    this.prepTarget.scrollIntoView()
  }

  preventInstructions (event) {
    console.log(this.instructionsTarget)
    event.preventDefault()
    this.instructionsTarget.scrollIntoView()
  }

  preventIngredients (event) {
    console.log(this.ingredientsTarget)
    event.preventDefault()
    this.ingredientsTarget.scrollIntoView()
  }

  preventCategory (event) {
    console.log(this.categoryTarget)
    event.preventDefault()
    this.categoryTarget.scrollIntoView()
  }

  preventPhoto (event) {
    console.log(this.photoTarget)
    event.preventDefault()
    this.photoTarget.scrollIntoView()
  }
}
