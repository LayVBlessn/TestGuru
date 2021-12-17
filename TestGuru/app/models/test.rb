# frozen_string_literal: true

class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'

  has_many :questions, dependent: :destroy
  has_many :tests_user, dependent: :delete_all
  has_many :users, through: :tests_user

  def self.tests_category(category)
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
      .pluck(:title)
  end
end
