class Committee < ApplicationRecord
  has_many :user_committees
  has_many :users, through: :user_committees

end
