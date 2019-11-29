class StatsController < ApplicationController
  skip_before_action :ensure_user_signed_up
  
  def index
    @user_stats = UserStatistics.new.compute
    @user_place = @user_stats.find_place(@user.id)
    @quiz_stats = QuizStatistics.new.compute
  end
end
