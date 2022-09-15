import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timer"
export default class extends Controller {
  static targets = ["date", "demo"]
  connect() {
    const demo = this.demoTarget
    var countDownDate = new Date(this.dateTarget.innerHTML);
    var x = setInterval(function() {
      var now = new Date().getTime();
      var distance = countDownDate - now;
      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      demo.innerHTML = days + " Days to go ⏳";
      if (distance < 0) {
        clearInterval(x);
       demo.innerHTML = "Its the BIG DAY! 💍 ";
      }
     }, 2000 );
  }
}
