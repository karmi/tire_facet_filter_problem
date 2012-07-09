# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.delete_all
cars = Category.create!(:name => 'Cars')
trucks = Category.create!(:name => 'Trucks')

Make.delete_all
alfa =  Make.create!(:name => 'Alfa Romeo', :category_id => cars.id)
audi =  Make.create!(:name => 'Audi', :category_id => cars.id)
bmw =  Make.create!(:name => 'BMW', :category_id => cars.id)
fiat =  Make.create!(:name => 'Fiat', :category_id => cars.id)
ford =  Make.create!(:name => 'Ford', :category_id => cars.id)
honda =  Make.create!(:name => 'Honda', :category_id => cars.id)
mercedes =  Make.create!(:name => 'Mercedes', :category_id => cars.id)
nissan =  Make.create!(:name => 'Nissan', :category_id => cars.id)
opel =  Make.create!(:name => 'Opel', :category_id => cars.id)
peugeot =  Make.create!(:name => 'Peugeot', :category_id => cars.id)
renault =  Make.create!(:name => 'Renault', :category_id => cars.id)
seat =  Make.create!(:name => 'Seat', :category_id => cars.id)
skoda =  Make.create!(:name => 'Škoda', :category_id => cars.id)
volkswagen =  Make.create!(:name => 'Volkswagen', :category_id => cars.id)
volvo =  Make.create!(:name => 'Volvo', :category_id => cars.id)

daf = Make.create!(:name => 'DAF', :category_id => trucks.id)
man = Make.create!(:name => 'MAN', :category_id => trucks.id)
scania = Make.create!(:name => 'Scania', :category_id => trucks.id)

Model.delete_all
alfa_156 = Model.create!(:name => '156', :make_id => alfa.id)
Model.create!(:name => '159', :make_id => alfa.id)
Model.create!(:name => 'Giulietta', :make_id => alfa.id)
Model.create!(:name => 'Spider', :make_id => alfa.id)

Model.create!(:name => '80', :make_id => audi.id)
Model.create!(:name => '100', :make_id => audi.id)
Model.create!(:name => 'A4', :make_id => audi.id)
Model.create!(:name => 'A6', :make_id => audi.id)

Model.create!(:name => '3', :make_id => bmw.id)
Model.create!(:name => '5', :make_id => bmw.id)
Model.create!(:name => '7', :make_id => bmw.id)
Model.create!(:name => 'X5', :make_id => bmw.id)

Model.create!(:name => '125', :make_id => fiat.id)
Model.create!(:name => '126p', :make_id => fiat.id)
Model.create!(:name => 'Bravo', :make_id => fiat.id)
fiat_croma = Model.create!(:name => 'Croma', :make_id => fiat.id)

Model.create!(:name => 'Escort', :make_id => ford.id)
Model.create!(:name => 'Focus', :make_id => ford.id)
Model.create!(:name => 'Mondeo', :make_id => ford.id)
Model.create!(:name => 'Sierra', :make_id => ford.id)

PartGroup.delete_all
starters = PartGroup.create!(:name => 'Starters')
brake_pads = PartGroup.create!(:name => 'Brake pads')
air_filters = PartGroup.create!(:name => 'Air Filters')
timing_belts = PartGroup.create!(:name => 'Timing Belts')


Vehicle.delete_all
alfa_156_1 = Vehicle.create!(:make_id => alfa.id, :model_id => alfa_156.id, :body_type => 'Hatchback', 
				:power => 100, :capacity => 1700, :year_from => 2000, :year_to => 2009)

alfa_156_2 = Vehicle.create!(:make_id => alfa.id, :model_id => alfa_156.id, :body_type => 'Hatchback', 
				:power => 150, :capacity => 1700, :year_from => 2000, :year_to => 2009)

alfa_156_3 = Vehicle.create!(:make_id => alfa.id, :model_id => alfa_156.id, :body_type => 'Hatchback', 
				:power => 200, :capacity => 1700, :year_from => 2000, :year_to => 2009)

fiat_croma_1 = Vehicle.create!(:make_id => fiat.id, :model_id => fiat_croma.id, :body_type => 'Combi', 
				:power => 105, :capacity => 1896, :year_from => 2006, :year_to => 2012)


Part.delete_all
Part.create!(:name => 'Starter', :description => 'Extended guarantee - 5 years', 
			 :part_group_id => starters.id, :vehicle_ids => [alfa_156_1.id, alfa_156_2.id])

Part.create!(:name => 'Brake pad', :description => '2 years warranty', 
			 :part_group_id => brake_pads.id, :vehicle_ids => [alfa_156_2.id])

Part.create!(:name => 'Air filter', :description => '200% performance boost', 
			 :part_group_id => air_filters.id, :vehicle_ids => [fiat_croma_1.id])