class QuizQuestionsController < ApplicationController
    before_action :set_user
    before_action :set_quiz
    before_action :set_quiz_question, only: [:ask, :answer]

    def find_next_question
        next_quiz_question = @quiz.quiz_questions.
                                order(order: :asc)
                                .detect { |qq| qq.answer.nil? }
        if next_quiz_question
          redirect_to ask_question_path(next_quiz_question.question)
        else
            # no more questions so let's finish the quiz
            @quiz.end_time = Time.now unless @quiz.end_time
            # and redirect to show the results
            redirect_to quiz_result_path
        end
    end

    def ask
        # @question_question is already set
    end

    def answer
        @quiz_question.mark_answer(quiz_question_params[:answer])
        if @quiz_question.save
            redirect_to find_next_question_path
        else
            render :ask
        end
    end

    private

    def set_user
        @user = User.find(session[:user_id])
    end

    def set_quiz
        @quiz = Quiz.find_by_user_id(session[:user_id])
    end

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