import { Controller } from "stimulus"
import { csrfToken } from "@rails/ujs"

export default class extends Controller {
  static targets = ["comments", "view", "hide"]
  static values = {recipe: Number, userecipe: Number}

  show() {
    this.commentsTarget.style.display = "unset";
    this.viewTarget.style.display = "none";
    this.hideTarget.style.display = "unset";
  }

  hide() {
    this.commentsTarget.style.display = "none";
    this.viewTarget.style.display = "unset";
    this.hideTarget.style.display = "none";
  }


}
