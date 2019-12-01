class ChartsController < ApplicationController
    skip_before_action :ensure_user_signed_up

    def team_stats
        render json: Quiz.joins(:user).group('users.team').average(:score)
    end
end
