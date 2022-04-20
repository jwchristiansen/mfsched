import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { with: String }

  connect() {
    this.element.dataset['action'] = 'submit->disable#disableForm'

    if (!this.hasWithValue) {
      this.withValue = "Processing..."
    }
  }

  disableForm() {
    this.submitButtons().forEach(button => {
      button.disabled = true
      button.value = this.withValue
    })
  }

  submitButtons() {
    return this.element.querySelectorAll("input[type='submit']")
  }
}
