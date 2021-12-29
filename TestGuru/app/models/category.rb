# frozen_string_literal: true

class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  validates :body, presence: true

  default_scope { order(body: :asc) }
end
