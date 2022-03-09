
import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = {
    workingRelationshipId: Number,
    currentUserId: Number
  }
  static targets = ["messages", "form", "message"]

  #renderMessageDivs() {
    this.messageTargets.forEach((div) => {
      const messageUserId = div.dataset.senderId
      if (messageUserId == this.currentUserIdValue){
        div.classList.add("message-current-user")
      } else{
        div.classList.add("message-other-user")
      }
    })
  }

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
    this.#renderMessageDivs()
    this.channel = consumer.subscriptions.create(
      {
        channel: "WorkingRelationshipChannel",
        id: this.workingRelationshipIdValue,
      },
      {
        received: (data) => {
          this.messagesTarget.insertAdjacentHTML("beforeend", data)
          this.#renderMessageDivs()
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
