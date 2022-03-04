import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["search", "recipesearch", "recipeinput", "recipelist", "usersearch", "userinput", "userlist"]

  connect() {
    this.searchRecipe()
  }

  changeView() {
    const selection = this.searchTarget.selectedIndex
    if (selection === 0) {
      this.recipesearchTarget.style.display = "unset";
      this.usersearchTarget.style.display = "none";
      this.recipelistTarget.innerHTML = ""
      this.userlistTarget.innerHTML = ""
    }
    if (selection === 1) {
      this.recipesearchTarget.style.display = "none";
      this.usersearchTarget.style.display = "unset";
      this.recipelistTarget.innerHTML = ""
      this.userlistTarget.innerHTML = ""
      this.searchUser()
    }
  }

  searchRecipe() {
    const url = `/recipes?query=${this.recipeinputTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.recipelistTarget.innerHTML = ""
        this.userlistTarget.innerHTML = ""
        this.recipelistTarget.insertAdjacentHTML('beforeend' ,data)
      })
  }

  searchUser() {
    const url = `/users?query=${this.userinputTarget.value}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        this.recipelistTarget.innerHTML = ""
        this.userlistTarget.innerHTML = ""
        this.userlistTarget.insertAdjacentHTML('beforeend' ,data)
      })
  }
}
