class StatisticsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "statistics"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
