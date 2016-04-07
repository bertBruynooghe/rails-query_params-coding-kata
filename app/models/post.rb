class Post < ActiveRecord::Base

  scope :title_starting_with, -> (expression) { where('title LIKE ?', "#{expression}%") }

  scope :for_params, -> (incoming_params) {
    incoming_params.reduce(self.where(nil)) do |result, (k, v)|
      result.respond_to?(k) ? result.send(k, v) : result
    end
  }
end
