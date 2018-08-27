class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :profile, :autosave => true
         has_many :children, :autosave => true
         has_one :family, :autosave => true
         has_one :membership

         # after_create :build_membership_infos
         after_create :create_profile
         after_create :create_family
         after_create :create_membership

           enum role: [:applicant, :user, :admin]
         after_initialize :set_default_role, :if => :new_record?

         def set_default_role
           self.role ||= :applicant
         end
end
