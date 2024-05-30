import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="price-calcul"
export default class extends Controller {
  static targets = ["form", "totalprice", "totalpricehidden"];
  static values = { offerprice: Number };
  price() {
    const start_date = new Date(this.formTarget.querySelector("#booking_start_date").value)
    const end_date = new Date(this.formTarget.querySelector("#booking_end_date").value)
    const days = (end_date - start_date)/((24*3600)*1000)
    if (days * this.offerpriceValue > 0) {
      this.totalpriceTarget.innerText = `${days * this.offerpriceValue} €`;
      this.totalpricehiddenTarget.value = days * this.offerpriceValue;
    }
  }
}
