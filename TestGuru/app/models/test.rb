# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :test_passages, dependent: :delete_all
  has_many :users, through: :test_passages
  has_many :questions, dependent: :destroy

  validates :title, presence: true, uniqueness: {
            scope: :level }

  validates :level, numericality: {
            only_integer: true,
            greater_than_or_equal_to: 0 },
            uniqueness: true

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :tests_by_category, (lambda do |category|
    joins(:category)
      .where(categories: { body: category })
      .order(body: :desc)
  end)

  def self.tests_by_category_array(category)
    tests_by_category(category).pluck(:title)
  end
end
