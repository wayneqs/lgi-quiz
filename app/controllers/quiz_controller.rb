class QuizController < ApplicationController
    before_action :set_user

    def new
    end

    def create
        QuizQuestion.transaction do
            quiz = Quiz.create(
                start_time: Time.now,
                user: @user
            )
            quiz.quiz_questions = create_quiz_questions
        end
        redirect_to find_next_question_path
    end

    def result
    end
    
    private

    def set_user
        @user = User.find(session[:user_id])
    end

    def create_quiz_questions
        Question.all.map.with_index {|question, idx|
            QuizQuestion.new(
                question: question,
                order: idx + 1
            )
        }
    end
end