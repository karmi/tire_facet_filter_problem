class Part < ActiveRecord::Base
  belongs_to :part_group
  has_many :vehicle_parts
  has_many :vehicles, :through => :vehicle_parts

  attr_accessible :description, :name, :part_group_id, :vehicle_ids

end
