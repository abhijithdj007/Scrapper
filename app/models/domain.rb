class Domain < ApplicationRecord
	has_many :user_domain_scraps

	validates_uniqueness_of :url, presence: true, format: URI.regexp(%w(http https))

	def scrap_domain(current_user)
		doc = Nokogiri::HTML(open("http://www.alexa.com/siteinfo/#{trim_url(self.url)}"))
    global_rank = doc.css('.globleRank div .metrics-data').text.gsub(/[^\d]/, '')
    india_rank = doc.css('.countryRank div .metrics-data').text.gsub(/[^\d]/, '')
    self.user_domain_scraps.create(user_id: current_user.id,global_rank: global_rank.to_i, india_rank: india_rank.to_i)
	end

	def trim_url(str)
		str.sub %r{^https?:(//|\\\\)(www\.)?}i, ''
	end
	
end
