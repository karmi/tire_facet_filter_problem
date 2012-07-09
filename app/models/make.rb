class Make < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :category_id
end
