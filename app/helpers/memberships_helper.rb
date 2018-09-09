module MembershipsHelper

  def pending_count
    @user = User.where(:role => "applicant").count
  end

  def total_member_count
    @user = User.all.count
  end
end
