import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {

  initFlatpickr() {
    const bookingForm = document.getElementById('booking-form-div');
    if (bookingForm) {
      const bookings = JSON.parse(bookingForm.dataset.bookings);
      flatpickr("#range_start", {
        plugins: [new rangePlugin({ input: "#range_end"})],
        minDate: "today",
        inline: true,
        dateFormat: "Y-m-d",
        "disable": bookings,
      })
    }
  };

  connect() {
    flatpickr(this.element)
  }
}
