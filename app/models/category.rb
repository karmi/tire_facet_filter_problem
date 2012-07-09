class Category < ActiveRecord::Base
  has_many :makes
  attr_accessible :name
end
