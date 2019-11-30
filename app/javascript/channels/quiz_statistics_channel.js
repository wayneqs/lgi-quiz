import consumer from "./consumer"

consumer.subscriptions.create("QuizStatisticsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var el = document.getElementById("quiz_stats");
    if (el != null) {
      el.innerHTML = data.html;
    }
  }
});
