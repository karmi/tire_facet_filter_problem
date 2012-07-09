class WelcomeController < ApplicationController
  
  def index
    paginate_per = 30

    group_id = params[:part_group]
    make_id = params[:make]
    model_id = params[:model]
    vehicle_category_id = params[:category]
    vehicle_power = params[:power]
    capacity = params[:capacity]
    q = params[:q]

    @results = Part.search do |search|
      search.query do |query|
        query.boolean do
          must { all } if q.blank?
          must { string q, :default_operator => 'AND' } unless q.blank?
        end
      end

      # filters
      search.filter :term, 'vehicles.power' => vehicle_power unless vehicle_power.blank?
      search.filter :term, 'vehicles.capacity' => capacity unless capacity.blank?

      # facets
      
      # this is how I understand it should work - please uncomment lines 30-48
      # 
      if capacity.blank?
        search.facet 'power' do
          terms 'vehicles.power', :size => 1000, :all_terms => true
        end
      else
        search.facet 'power' do
          terms 'vehicles.power', :size => 1000, :all_terms => true, :facet_filter => {:term => {'vehicles.capacity' => capacity}}
        end
      end

      if vehicle_power.blank?
        search.facet 'capacity' do
          terms 'vehicles.capacity', :size => 1000, :all_terms => true
        end
      else
        search.facet 'capacity' do
          terms 'vehicles.capacity', :size => 1000, :all_terms => true, :facet_filter => {:term => {'vehicles.power' => vehicle_power.to_i}}
        end
      end
      # this below is working, but not filtering facet when one is selected
      # comment this out (lines 52-58) when lines 30-48 are uncommented
      #
      # search.facet 'power' do
      #   terms 'vehicles.power', :size => 1000, :all_terms => true
      # end

      # search.facet 'capacity' do
      #   terms 'vehicles.capacity', :size => 1000, :all_terms => true
      # end

       # pagination
      search.from ((params[:page].present? ? params[:page].to_i : 1).to_i * paginate_per) - paginate_per
      search.size paginate_per
      
      # debugging
      @json_query = search.to_json
      @curl_query = search.to_curl
      #raise search.to_json
      #raise search.to_curl
    end

    @categories = Category.includes(:makes).all
    @makes = Make.includes(:models).all
    @models = Model.all
    @groups = PartGroup.all
  end
end
