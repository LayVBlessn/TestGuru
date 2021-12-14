class Test < ApplicationRecord

  def self.tests_list_by_category(category)
    Test.joins('JOIN categories ON categories.id = tests.category_id')
    .where('categories.body = ?', category)
    .order(title: :asc)
    .pluck(:title)
  end

end
