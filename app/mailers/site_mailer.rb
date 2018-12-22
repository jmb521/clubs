class SiteMailer < ApplicationMailer
  helper :application
  default from: 'announcements@tcmottc.org'


  def site_issue(data)
    @issue = data

    mail(to: 'jmp521@gmail.com', subject: "An Issue with the site has been found")
  end
end
