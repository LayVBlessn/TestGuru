class User < ApplicationRecord

  def tests_list_by_level(level)
    Test.joins('JOIN user_passed_tests ON user_passed_tests.test_id = tests.id')
    .where('tests.level = ? AND user_passed_tests.user_id = tests.author_id', level)
  end

end
