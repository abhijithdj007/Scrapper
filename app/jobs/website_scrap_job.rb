class WebsiteScrapJob < ApplicationJob
  queue_as :default
  include SuckerPunch::Job

  def perform
    UserDomainScrap.scrap_all
  end
end
