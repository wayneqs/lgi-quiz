class StatsController < ApplicationController
  skip_before_action :ensure_user_signed_up
  
  def index
    @stats = Statistics.new(@user).compute
  end
end
