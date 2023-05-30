import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs and the price_total and price_per_day
  static targets = ["startTime", "endTime", "price", "carPrice", "submitButton"]

  connect() {
    flatpickr(this.startTimeTarget, {})
    flatpickr(this.endTimeTarget, {})
  }

  calculate() {
    const startDate = this.startTimeTarget._flatpickr.selectedDates[0];
    const endDate = this.endTimeTarget._flatpickr.selectedDates[0];
    const carPrice = parseInt(this.carPriceTarget.textContent, 10);

    // calculate date difference, make sure
    if (endDate.getTime() > startDate.getTime()) {
      this.priceTarget.classList.remove("text-danger", "fs-6");
      this.submitButtonTarget.disabled = false;
      const diffTime = Math.abs(endDate - startDate);
      const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
      this.priceTarget.innerText = `Total Price: €${diffDays * carPrice}.00`;
    } else {
      this.priceTarget.classList.add("fs-6", "text-danger");
      this.priceTarget.innerText = "Please select a valid date range!";
      console.log(this.submitButtonTarget)
      this.submitButtonTarget.disabled = true;
    }

  }
}
