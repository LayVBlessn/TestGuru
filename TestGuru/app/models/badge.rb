class Badge < ApplicationRecord
  enum rule: { tests_by_level: 1, tests_by_category: 2, test_with_first_try: 3 }, _suffix: true

  validates :name, :rule, presence: true

  has_many :badges_users, class_name: 'BadgesUsers', dependent: :delete_all
  has_many :users, through: :badges_users
end
