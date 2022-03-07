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
    this.moreTarget.insertAdjacentHTML("beforebegin", `<input class=\"form-control string optional\" name=\"recipe[categories][${currentCategoryPosition}]\" type=\"text\" value=\"\" id=\"recipe_categories-${currentCategoryPosition}\"><br>`);
    currentCategoryPosition += 1;
  }
  moreIngr (event) {
    this.moreTarget.insertAdjacentHTML("beforebegin", `<input class=\"form-control string optional\" name=\"recipe[ingredients][${currentIngPosition}]\" type=\"text\" value=\"\" id=\"recipe_ingredients-${currentIngPosition}\"><br>`);
    currentIngPosition += 1;
  }
  moreInst (event) {
    this.moreTarget.insertAdjacentHTML("beforebegin", `<input class=\"form-control string optional\" name=\"recipe[instructions][${currentInstPosition}]\" type=\"text\" value=\"\" id=\"recipe_instructions-${currentInstPosition}\"><br>`);
    currentInstPosition += 1;
  }

  lessCat (event) {
    id = document.getElementById(`recipe_categories-${currentCategoryPosition - 1}`)
    console.log(id)
    id.remove();
  }

}
