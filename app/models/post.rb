class Post < ActiveRecord::Base
  scope :title_starting_with, -> (expression) { where('title LIKE ?', "#{expression}%") }
end
