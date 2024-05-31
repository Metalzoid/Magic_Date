import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  static targets = ["form"];

  submitform() {
    this.formTarget.submit()
  }

  
}
