class StatsController < ApplicationController
  def index
    q = "users.id as user_id,
        users.name as username,
        quizzes.score as score, 
        (quizzes.end_time - quizzes.start_time) as time"
    results = Quiz
                .joins(:user)
                .select(q)
                .order(score: :desc, time: :asc)
    if @user
      @place = results.map(&:user_id).index(@user.id) + 1
    end
    @leaderboard = results.take(7).map { |result| result.username }
    @completed_test_count = Quiz.where("end_time is not null").count
    @inprogress_test_count = Quiz.all.count - @completed_test_count
  end
end
