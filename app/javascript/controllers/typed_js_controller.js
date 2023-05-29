import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

export default class extends Controller {
  connect() {
    new Typed(this.element, {
      strings: ["and go to holiday in Galicia!", "and go visit your friends!", "take care of an unplanned emergency!"],
      typeSpeed: 40,
      loop: true
    })
  }
}
