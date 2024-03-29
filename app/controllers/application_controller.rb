class ApplicationController < ActionController::Base
    before_action :set_user, :set_quiz
    before_action :ensure_user_signed_up

    private

    def set_user
        @user = User.find_by_id(session[:user_id])
    end

    def set_quiz
        @quiz = Quiz.includes(:quiz_questions).find_by_user_id(session[:user_id])
    end

    def ensure_user_signed_up
        if @user.nil?
            redirect_to new_user_path
        end
    end
end
