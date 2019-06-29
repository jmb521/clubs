class Membership < ApplicationRecord
  belongs_to :user
  has_many :payments
  
end
