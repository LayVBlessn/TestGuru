# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :title, presence: true
  validate :validate_answers_number
  
  scope :correct, -> { where(correct: true) }

  def validate_answers_number
    errors.add :base if question.answers.count >= 4
  end
end
