import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {


  static values = {filter: String}
  static targets = ["filter"]

  connect() {
    console.log(this.filterValue.class === String)
  }
//   selectButton() {
//     .target.reset()
//   }
 }
