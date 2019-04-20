require 'open-uri'
require 'pry'
require 'nokogiri'

class Scraper

  def self.scrape_index_page(index_url)
    html = open(index_url)
    list = Nokogiri::HTML
    
    student_array = []
    
    list.css(".student-card a").each do |student|
      student_hash = {
        :name => student.css(".student-name").text,
        :location => student.css(".student-location").text,
        :profile_url => student.attribute("href").value
        }
        student_array << student_hash
      end
      student_array
  end

  def self.scrape_profile_page(profile_url)
    html = open(profile_url)
  profiles = Nokogiri::HTML(html)

    student_hash  = {}
    links = profiles.css(".social-icon-container a").map {|anchor_tag| anchor_tag.attribute("href").value}
    
    links.each do |link|
      if link.include?("twitter")
        student_hash[:twitter] = link
      elsif link.include?("github")
        student_hash[:github] = link
      elsif link.include?("linkedin")
        student_hash[:linkedin] = link
      else 
        student_hash[:blog] = link
    end
  end

end

