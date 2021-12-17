class Test < ApplicationRecord

  belongs_to :category
  has_many :questions
  has_many :tests_user
  has_many :users, through: :tests_user

  def self.tests_category(category)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
    .where('categories.body = ?', category)
    .order(title: :asc)
    .pluck(:title)
  end

end
