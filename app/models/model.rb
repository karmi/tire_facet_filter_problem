class Model < ActiveRecord::Base
  belongs_to :make
  attr_accessible :name, :make_id
end
