class Vehicle < ActiveRecord::Base
  belongs_to :make
  belongs_to :model
  has_many :vehicle_parts
  has_many :parts, :through => :vehicle_parts
  attr_accessible :body_type, :capacity, :power, :year_from, :year_to, :make_id, :model_id
end
