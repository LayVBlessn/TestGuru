# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true

  scope :right_answers, -> { where(correct: true).pluck(:title) }

  def validate_answers_number
    errors.add :base if question.answers.count > 3
  end
end
