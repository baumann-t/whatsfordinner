import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["search", "recipesearch", "recipeinput", "recipelist", "usersearch", "userinput", "userlist"]

  changeView() {
    const selection = this.searchTarget.selectedIndex
    if (selection === 1) {
      this.recipesearchTarget.style.visibility = "hidden";
      this.usersearchTarget.style.visibility = "visible";
    }
    if (selection === 0) {
      this.recipesearchTarget.style.visibility = "visible";
      this.usersearchTarget.style.visibility = "hidden";
    }
  }

  searchRecipe() {
    const url = `/recipes?query=${this.recipeinputTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.recipelistTarget.innerHTML = ""
        this.recipelistTarget.insertAdjacentHTML('beforeend' ,data)
      })
  }

  searchUser() {
    console.log(this.inputTarget.value)
  }
}
