class Quiz < ApplicationRecord
  has_many :quiz_questions
  has_many :questions, through: :quiz_questions
  belongs_to :user

  def question_count
    quiz_questions.count
  end
end
