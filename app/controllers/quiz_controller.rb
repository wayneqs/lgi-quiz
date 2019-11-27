class QuizController < ApplicationController
    before_action :set_user

    def new
    end

    private

    def set_user
        @user = User.find(session[:user_id])
    end
end