class Quiz < ApplicationRecord
  has_many :quiz_questions, dependent: :destroy
  has_many :questions, through: :quiz_questions
  belongs_to :user

  def question_count
    quiz_questions.count
  end

  def mark
    reset_quiz
    quiz_questions.each {|qq|
      (score, max_score) = mark_question(qq)
      write_attribute(:score, read_attribute(:score) + score)
      write_attribute(:max_score, read_attribute(:max_score) + max_score)
    }
  end

  def percent
    return 0 if max_score == 0
    (score.fdiv(max_score) * 100).round(2)
  end

  private

  def reset_quiz
    write_attribute(:score, 0)
    write_attribute(:max_score, 0)
  end

  def mark_question(quiz_question)
    score = quiz_question.score
    max_score = quiz_question.question.question_options.max { |a,b|
      a.score <=> b.score
    }.score
    [score, max_score]
  end
end
