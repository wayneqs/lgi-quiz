import consumer from "./consumer"

consumer.subscriptions.create("TeamStatisticsChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var chart = Chartkick.charts["chart-1"];
    chart.updateData(data.json);
  }
});
