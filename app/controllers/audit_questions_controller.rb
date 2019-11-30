class AuditQuestionsController < ApplicationController
    skip_before_action :ensure_user_signed_up
    skip_before_action :set_quiz

    def index
        respond_to do |format|
            format.html { redirect_to audit_question_path(id: 1) }
        end
    end

    def show
        respond_to do |format|
            @ordinal = params[:id].to_i
            questions = Question.includes(:question_options).all
            @count = questions.count
            unless @ordinal.between?(1, @count)
                format.html { redirect_to audit_question_path(id: 1) }
            else
                @question = find_question(questions)
                @previous = @ordinal - 1
                @previous_disabled = @previous < 1
                @next = @ordinal + 1
                @next_disabled = @next > @count
                format.html { render :show }
            end
        end
    end

    private

    def find_question(questions)
        questions[@ordinal - 1]
    end
end