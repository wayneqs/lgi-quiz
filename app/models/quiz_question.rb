class QuizQuestion < ApplicationRecord
    belongs_to :quiz
    belongs_to :question

    def mark_answer(value)
        option = question.question_options.detect {|q| q.prompt == value}
        if option
            write_attribute(:answer, value)
            write_attribute(:score, option.score)
        end
    end
end