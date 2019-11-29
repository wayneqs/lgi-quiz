class LeaderboardChannel < ApplicationCable::Channel
  def subscribed
    stream_from "leaderboard"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.broadcast_leaderboard(top_quizzers)
    ActionCable.server.broadcast "leaderboard", 
      html: ApplicationController.render(partial: 'stats/leaderboard',
              locals: { leaders: top_quizzers }
          )
  end
end
