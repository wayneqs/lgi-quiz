class StatsController < ApplicationController
  def index
    q = "users.id, users.name, quizzes.score, (quizzes.end_time - quizzes.start_time) as time"
    sorted_quizzes = Quiz
                      .joins(:user)
                      .select(q)
                      .order(score: :desc, time: :asc)
    if @user
      @place = sorted_quizzes.map(&:id).index(@user.id) + 1
    end
    @leaderboard = sorted_quizzes.take(7).map { |quiz| quiz.user.name }
    @completed_test_count = Quiz.where("end_time is not null").count
    @inprogress_test_count = Quiz.all.count - @completed_test_count
  end

end
