require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  #binding.pry

  projects = {}

  kickstarter.css('li.project.grid_4').each do |project|
    title = project.css('h2.bbcard_name strong a').text
      projects[title.to_sym] = {
        :image_link => project.css('div.project-thumbnail a img').attribute('src').value,
        :description => project.css('p.bbcard_blurb').text,
        :location => project.css('ul.project-meta span.location-name').text,
        :percent_funded => project.css('ul.project-stats li.first.funded strong').text.gsub("%", "").to_i
      }

  end
  #binding.pry
  projects
end
#project.css('h2.bbcard_name strong a').text
#kickstarter.css('li.projectgrid_4') - project
#project.css('h2.bbcard_name strong a') - title
#project.css('div.project-thumbnail a img').attribute('src').value  image
#project.css('p.bbcard_blurb').text - description
#project.css('span.location-name').text - location-name
#project.css('ul.li.project-stats li.first.funded strong').text.gsub("%", "") percent funded
