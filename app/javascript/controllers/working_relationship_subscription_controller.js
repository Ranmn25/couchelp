
import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = {
    workingRelationshipId: Number
  }
  static targets = ["messages", "form"]

  submitForm(evt) {
    console.log('form submited', evt.target.value);
  }

  #resetForm() {
    this.formTarget.reset()
  }

  #scrollMessagesToEnd() {
    this.messagesTarget.scrollTo(0, this.messagesTarget.scrollHeight)
  }

  connect() {
    this.channel = consumer.subscriptions.create(
      {
        channel: "WorkingRelationshipChannel",
        id: this.workingRelationshipIdValue,
      },
      {
        received: (data) => {
          this.messagesTarget.insertAdjacentHTML("beforeend", data)
          this.#scrollMessagesToEnd()
          this.#resetForm()
        }
      }
    )
    console.log(`Subscribed to the chatroom with the id ${this.workingRelationshipIdValue}.`)
    this.#scrollMessagesToEnd()
  }

  disconnect() {
    console.log("Unsubscribed from the chatroom")
    this.channel.unsubscribe()
  }
}
