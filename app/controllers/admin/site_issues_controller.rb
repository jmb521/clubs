class Admin::SiteIssuesController < ApplicationController

  def index
    @site_issues = SiteIssue.all
  end

  def destroy
    
    @site_issue = SiteIssue.find(params[:id])
    @site_issue.destroy
    redirect_to admin_site_issues_path
  end
end
