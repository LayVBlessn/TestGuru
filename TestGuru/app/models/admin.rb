class Admin < User
  validates :fist_name, presence: true
  validates :last_name, presence: true
end
