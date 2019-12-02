class TeamStatisticsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "team_statistics"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.broadcast_stats()
    ActionCable.server.broadcast "team_statistics", 
      json: Quiz.joins(:user).group('users.team').average(:score)
  end
end
