class ScrapperController < ApplicationController
	before_action :authenticate_user!

	def index
		redirect_to admin_root_path if current_user.roles == 0
		@domain = Domain.new
	end

	def scrap_domain
		@domain = Domain.find_or_initialize_by(url: scrap_params[:url])
		if @domain.save
			@scrap_info = @domain.scrap_domain(current_user)
			@graph_report = UserDomainScrap.generate_graph(@domain.id) if @scrap_info.present?
		end
	end

	private
	def scrap_params
		params.require(:domain).permit(:url)
	end
end
