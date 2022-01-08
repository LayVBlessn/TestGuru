# frozen_string_literal: true

class User < ApplicationRecord
  has_many :created_tests, class_name: 'Test', foreign_key: 'author_id', dependent: :destroy
  has_many :tests_user, dependent: :delete_all
  has_many :tests, through: :tests_user

  validates :email, presence: true, uniqueness: true

  def tests_level(level)
    tests.where(level: level)
  end
end
