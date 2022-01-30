# frozen_string_literal: true

class TestPassage < ApplicationRecord
  PASSAGE_PERCENT = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_update :set_next_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)

    save!
  end

  def completed?
    current_question.nil? || timer_has_expired?
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def test_passed?
    test_passed_percent >= PASSAGE_PERCENT
  end

  def test_passed_percent
    (correct_questions / test.questions.count.to_f * 100).round
  end

  private

  def set_next_question
    self.current_question = next_question
  end

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    return false if answer_ids.nil?
    correct_answers.ids.sort == answer_ids.map(&:to_i).sort
  end

  def timer_has_expired?
    test.timer_presence && created_at + test.timer_value.minutes < Time.current
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    return test.questions.first if current_question.nil?
    return nil if timer_has_expired?

    test.questions.order(:id).where('id > ?', current_question.id).first
  end
end
