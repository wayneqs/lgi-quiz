class ChartsController < ApplicationController
    def team_stats
        render json: Quiz.joins(:user).group('users.team').sum(:score)
    end
end
