import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="status-booking"
export default class extends Controller {
  static targets = ["form"];
  status() {
    this.formTarget.submit()
  }
}
