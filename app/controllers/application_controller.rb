class ApplicationController < ActionController::Base
    before_action :set_user, :set_quiz

    private

    def set_user
        @user = User.find_by_id(session[:user_id])
    end

    def set_quiz
        @quiz = Quiz.find_by_user_id(session[:user_id])
    end
end
