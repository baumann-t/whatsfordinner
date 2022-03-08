import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["home", "cookbook", "wishlist", "profile", "search"]

  connect() {
    document.body.addEventListener('click', this.menuRefresh());
  }

  menuRefresh(){
    const path = window.location.href
    if (path.includes("/my-cookbook")) {
      this.cookbookTarget.classList.remove("inactive")
    } else if (path.includes("wishlist")) {
      this.wishlistTarget.classList.remove("inactive")
    } else if (path.includes("my-profile")) {
      this.profileTarget.classList.remove("inactive")
    } else if (path.includes("following")) {
      this.profileTarget.classList.remove("inactive")
    } else if (path.includes("users/edit")) {
      this.profileTarget.classList.remove("inactive")
    } else if (path.includes("search")) {
      this.searchTarget.classList.remove("inactive")
    } else if (path.includes("cookbook/")) {
      this.searchTarget.classList.remove("inactive")
    } else if (path.includes("cookbooks/users/")) {
      this.searchTarget.classList.remove("inactive")
    } else {
      this.homeTarget.classList.remove("inactive")
    }
  }


}
