import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs and the price_total and price_per_day
  static targets = [ "startTime", "endTime", "price", "carPrice" ]

  connect() {
    flatpickr(this.startTimeTarget, {})
    flatpickr(this.endTimeTarget, {})
  }

  calculate() {
    const startDate = this.startTimeTarget._flatpickr.selectedDates[0];
    const endDate = this.endTimeTarget._flatpickr.selectedDates[0];
    const carPrice = this.carPriceTarget;
    console.log(carPrice);
    // calculate date difference, make sure
    if (endDate.getTime() > startDate.getTime()) {
      const diffTime = Math.abs(endDate - startDate);
      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
      console.log(`A total of ${diffDays} passed`);
      this.priceTarget.innerText = diffDays * carPrice;
    }

  }
}
