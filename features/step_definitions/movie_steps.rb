require 'simplecov'
SimpleCov.start 'rails'

Given /the following movies exist/ do |movie_table|
  movie_table.hashes.each do |movie|
  m = Movie.create!(movie)
    if m == nil
      flunk "No movies inserted"
    end
  end
end

Then /the director of (.*) should be (.*)/ do |title, director|
  title = title.gsub('"','')
  movie = Movie.find_by_title(title)
 if movie.director != director.gsub('"','')
   flunk "Expected : #{director.gsub(/\W/,'')} Actual : #{movie.director}"
 end
end

#Then /I should be on the Similar Movies page for (.*)/ do |movie|
#  movie = movie.gsub('""','')
#  field_labeled ('movie_title').should equal movie.title
#end
