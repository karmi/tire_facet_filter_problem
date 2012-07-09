class Part < ActiveRecord::Base
  include Tire::Model::Search
  include Tire::Model::Callbacks
  belongs_to :part_group
  has_many :vehicle_parts
  has_many :vehicles, :through => :vehicle_parts

  attr_accessible :description, :name, :part_group_id, :vehicle_ids

  def to_indexed_json
    {
      :name => name,
      :description => description,
      :part_group_id => part_group_id,
      #:vehicles => vehicles.to_json(methods: [:make_name, :model_name])
      :vehicles => vehicles
    }.to_json
  end

end