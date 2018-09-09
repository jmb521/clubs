class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        has_one :profile, :autosave => true
        has_many :children
        has_one :family, :autosave => true
        has_one :membership, :autosave => true
        has_many :user_committees
        has_many :committees, :through => :user_committees

        after_create :create_family
        after_create :create_membership
        after_create :create_profile





           enum role: [:former, :applicant, :member, :admin]
         after_initialize :set_default_role, :if => :new_record?

         def set_default_role
           self.role ||= :applicant
         end

         def is_admin
           user.admin?
         end
end
