# frozen_string_literal: true

class Category < ApplicationRecord
  default_scope { order(body: :asc) }

  has_many :tests, dependent: :nullify

  validates :body, presence: true
end
