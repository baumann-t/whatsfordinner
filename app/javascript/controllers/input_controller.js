import { Controller } from "stimulus"

let currentCategoryPosition = 1
let currentInstPosition = 1
let currentIngPosition = 1

export default class extends Controller {
  static targets = ["less","more"]

  connect() {
    console.log("connected")
  }

  moreCat (event) {
    this.moreTarget.insertAdjacentHTML("beforebegin", `<div id=\"recipe_categories-${currentCategoryPosition}\"><input class=\"form-control string optional\" name=\"recipe[categories][${currentCategoryPosition}]\" type=\"text\" value=\"\"><br></div>`);
    currentCategoryPosition += 1;
  }

  moreIngr (event) {
    this.moreTarget.insertAdjacentHTML("beforebegin", `<div id=\"recipe_ingredients-${currentIngPosition}\"><input class=\"form-control string optional\" name=\"recipe[ingredients][${currentIngPosition}]\" type=\"text\" value=\"\"><br></div>`);
    currentIngPosition += 1;
  }

  moreInst (event) {
    this.moreTarget.insertAdjacentHTML("beforebegin", `<div id=\"recipe_instructions-${currentInstPosition}\"><input class=\"form-control string optional\" name=\"recipe[instructions][${currentInstPosition}]\" type=\"text\" value=\"\"><br></div>`);
    currentInstPosition += 1;
  }

  lessCat (event) {
    currentCategoryPosition -= 1
    const id = document.getElementById(`recipe_categories-${currentCategoryPosition}`)
    console.log(id)
    id.remove();
  }

  lessIngr (event) {
    currentIngPosition -= 1
    const id = document.getElementById(`recipe_ingredients-${currentIngPosition}`)
    console.log(id)
    id.remove();
  }

  lessInst (event) {
    currentInstPosition -= 1
    const id = document.getElementById(`recipe_instructions-${currentInstPosition}`)
    console.log(id)
    id.remove();
  }

}
