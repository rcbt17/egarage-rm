import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="livesearch"
export default class extends Controller {
  process() {
    const pluralize = (count, noun, suffix = 's') =>
      `${count} ${noun}${count !== 1 ? suffix : ''}`;

    const elements = document.getElementsByClassName("car");
    const input = document.getElementById("search").value.toLowerCase();
    console.log(input);
    Array.from(elements).forEach((card) => {
      card.classList.remove("d-none");
    });
    let count = 0;
    Array.from(elements).forEach((card) => {
      const name = card.getElementsByClassName("name");
      if (!name[0].innerText.toLowerCase().includes(input)) {
        card.classList.add("d-none");
      } else {
        count += 1;
      }
    });
    const results = document.getElementById("results_count");
    if (elements.length === count) {
      results.classList.add("d-none");
    } else {
      results.classList.remove('d-none');
      results.innerText = `Your search found a total of: ${pluralize(count, 'car')}`;
    }

  }

}
