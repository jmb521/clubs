module MembershipsHelper

  def pending_count
    @user = User.where(:role => "applicant").count
  end
end
