class Make < ActiveRecord::Base
  belongs_to :category
    has_many :models
  attr_accessible :name, :category_id
end
