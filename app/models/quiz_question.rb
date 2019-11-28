class QuizQuestion < ApplicationRecord
    belongs_to :quiz
    belongs_to :question
    after_save :re_score_quiz

    def mark_answer(value)
        option = question.question_options.detect {|q| q.prompt == value}
        if option
            write_attribute(:answer, value)
            write_attribute(:score, option.score)
        end
    end

    private

    def re_score_quiz
        quiz.mark
    end
end