class VehiclePart < ActiveRecord::Base
  belongs_to :part
  belongs_to :vehicle
  # attr_accessible :title, :body
end
