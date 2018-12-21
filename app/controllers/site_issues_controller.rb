class SiteIssuesController < ApplicationController

  def new
    @site_issue = SiteIssue.new
  end

  def create
    @site_issue = SiteIssue.create(params)
  end
end
