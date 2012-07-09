class Vehicle < ActiveRecord::Base
  belongs_to :make
  belongs_to :model
  has_many :vehicle_parts
  has_many :parts, :through => :vehicle_parts
  attr_accessible :body_type, :capacity, :power, :year_from, :year_to, :make_id, :model_id

  def name
  	"#{self.make.name} #{self.model.name} #{self.year_from}-#{self.year_to} (#{self.power} KM)"
  end
end
