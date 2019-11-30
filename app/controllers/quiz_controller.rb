class QuizController < ApplicationController

    def toggle_audit_mode
        respond_to do |format|
            session[:audit_mode] = false unless session[:audit_mode] 
            session[:audit_mode] = !session[:audit_mode]
            format.html { redirect_to find_next_question_path }
        end
    end

    def new
    end

    def create
        respond_to do |format|
            QuizQuestion.transaction do
                quiz = Quiz.create(
                    start_time: Time.now,
                    user: @user
                )
                quiz.quiz_questions = create_quiz_questions
            end
            
            format.html { redirect_to find_next_question_path }

            helpers.broadcast_quiz_info
            helpers.broadcast_user_stats
        end
    end

    def result
    end
    
    private

    def create_quiz_questions
        now = Time.now
        Question.all.map.with_index {|question, idx|
            QuizQuestion.new(
                question: question,
                order: idx + 1,
                created_at: now,
                updated_at: now
            )
        }
    end
end