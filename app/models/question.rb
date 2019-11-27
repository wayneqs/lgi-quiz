class Question < ApplicationRecord
    has_many :question_options
    accepts_nested_attributes_for :question_options
end
