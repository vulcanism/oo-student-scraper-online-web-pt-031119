require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    list = Nokogiri::HTML
    
    student_array = []
    
    
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

