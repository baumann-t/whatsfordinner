import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["desc","prep","cooking", "servings","instructions","ingredients","category","photo"]

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

  preventCooking (event) {
    console.log(this.cookingTarget)
    event.preventDefault()
    this.cookingTarget.scrollIntoView()
  }

  preventServings (event) {
    console.log(this.servingsTarget)
    event.preventDefault()
    this.servingsTarget.scrollIntoView()
  }

  preventIngredients (event) {
    console.log(this.ingredientsTarget)
    event.preventDefault()
    this.ingredientsTarget.scrollIntoView()
  }

  preventInstructions (event) {
    console.log(this.instructionsTarget)
    event.preventDefault()
    this.instructionsTarget.scrollIntoView()
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
