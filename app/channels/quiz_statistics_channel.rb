class QuizStatisticsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "quiz_statistics"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def self.broadcast_quiz_stats(stats)
    ActionCable.server.broadcast "quiz_statistics", 
      html: ApplicationController.render(partial: 'stats/quiz_stats',
              locals: { stats: stats }
          )
  end
end
