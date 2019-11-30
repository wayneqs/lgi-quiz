class QuizQuestionsController < ApplicationController
    before_action :set_quiz_question, only: [:ask, :answer]

    def find_next_question
        respond_to do |format|
            next_quiz_question = @quiz.quiz_questions.
                                    order(order: :asc)
                                    .detect { |qq| qq.answer.nil? }
            if next_quiz_question
                format.html { redirect_to ask_question_path(next_quiz_question.question) }
            else
                # no more questions so let's finish the quiz and mark it
                @quiz.end_time = Time.now unless @quiz.end_time
                @quiz.mark
                if @quiz.save
                    format.html { redirect_to quiz_result_path }
                    helpers.broadcast_quiz_stats
                end
            end
        end
    end

    def ask
        # @quiz_question is already set
    end

    def answer
        respond_to do |format|
            @quiz_question.mark_answer(quiz_question_params[:answer])
            @quiz_question.save
            @quiz_question.quiz.save
            
            format.html { redirect_to find_next_question_path }

            helpers.broadcast_user_stats
            helpers.broadcast_team_stats
        end
    end

    private

    def set_quiz_question
        @quiz_question = QuizQuestion.where(
            quiz_id: @quiz.id,
            question_id: params[:id]
        ).first
    end

    def quiz_question_params
        params.fetch(:quiz_question, {}).permit(:answer)
    end
end