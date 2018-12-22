class SiteIssuesController < ApplicationController

  def new
    @site_issues = SiteIssue.new
  end

  def create
    @site_issues = SiteIssue.create(site_issue_params)
    SiteMailer.site_issue(@site_issues).deliver_now
    redirect_to users_path
  end



  private

  def site_issue_params
    params.require(:site_issue).permit(:name, :email, :concern)
  end
end
