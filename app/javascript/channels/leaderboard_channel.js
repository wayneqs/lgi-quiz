import consumer from "./consumer"

consumer.subscriptions.create("LeaderboardChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var leaderBoard = document.getElementById("leaderboard");
    if (leaderBoard != null) {
      leaderBoard.innerHTML = data.html;
    }
  }
});
