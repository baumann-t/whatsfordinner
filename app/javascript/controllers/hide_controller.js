import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["comments", "view", "hide", "text", "list"]
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
    const commentNum = document.querySelectorAll("#comment-list-li").length
    if (commentNum === 1){
      this.textTarget.innerHTML = "VIEW 1 COMMENT"
    } else if (commentNum === 0){
      this.textTarget.innerHTML = "ADD A COMMENT"
    } else {
      this.textTarget.innerHTML = `VIEW ${commentNum} COMMENTS`
    }
  }
}
