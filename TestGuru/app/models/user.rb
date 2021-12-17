class User < ApplicationRecord


  has_many :tests_user
  has_many :tests, through: :tests_user


  def tests_level(level)
    Test.joins('JOIN tests_user ON tests_user.test_id = tests.id')
    .where('tests.level = ? AND tests_user.user_id = tests.author_id', level)
  end

end
