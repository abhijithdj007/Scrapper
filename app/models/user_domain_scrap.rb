class UserDomainScrap < ApplicationRecord
  belongs_to :user
  belongs_to :domain

  scope :domain, -> (domain_id) { where(domain_id: domain_id) }
  scope :date_filter, -> (start_date,end_date) { where(created_at: start_date..end_date) }

	def self.generate_graph(domain_id)
		records = domain(domain_id).date_filter(Time.now - 7.days,Time.now).group_by{ |e| e.created_at.to_date.to_s }
		global_ranks = records.map { |k,v| v.last.global_rank }
		india_ranks = records.map { |k,v| v.last.india_rank }
		return records.keys,global_ranks,india_ranks
	end

	def self.scrap_all
		Domain.all.each do |x|
			generate_graph(x.id)
		end
	end

end
