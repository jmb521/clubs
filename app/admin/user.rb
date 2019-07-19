ActiveAdmin.register User do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :role, collection: ["former","applicant", "member", "admin"]
    end
    f.button "Submit"
  end

  create_or_edit = Proc.new {
    @user            = User.find_or_create_by(id: params[:id])
    # @user.superadmin = params[:user][:superadmin]
    # @user.attributes = params[:user].delete_if do |k, v|
      # binding.pry
      # (k == "role") ||
      # (["password", "password_confirmation"].include?(k) && v.empty? && !@user.new_record?)
    # end
    
    @user.role = params[:user][:role]
    
    if @user.save
      redirect_to :action => :show, :id => @user.id
    else
      render active_admin_template((@user.new_record? ? 'new' : 'edit') + '.html.erb')
    end
  }
  member_action :create, :method => :post, &create_or_edit
  member_action :update, :method => :put, &create_or_edit


end
