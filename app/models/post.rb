class Post < ActiveRecord::Base

  scope :title_starting_with, -> (expression) { where('title LIKE ?', "#{expression}%") }

  scope :for_params, -> (p) {
    p.reduce(self.where(nil)) do |c, (k, v)|
      c.respond_to?(k) ? c.send(k, v) : c
    end
  }
end
