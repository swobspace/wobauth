class Category < ActiveRecord::Base
  def self.data_url
    Rails.application.routes.url_helpers.categories_path(format: :json)
  end

  def to_s
    name
  end
end
