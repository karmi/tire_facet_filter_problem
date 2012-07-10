class WelcomeController < ApplicationController
  
  def index
    paginate_per = 30

    # Helper variables
    # TODO: Remove, use just `params`?
    #
    group_id            = params[:part_group]
    make_id             = params[:make]
    model_id            = params[:model]
    vehicle_category_id = params[:category]
    vehicle_power       = params[:power]
    vehicle_capacity    = params[:capacity]
    q                   = params[:q]

    @results = Part.search do |search|

      # 1. Search query
      #
      search.query do |query|
        query.boolean do
          # Return all results when no user query has been passed
          # TODO: Use `sort` in this case?
          #
          must { all } if q.blank?

          # Search for user provided query
          #
          must { string q, :default_operator => 'AND' } unless q.blank?
        end
      end

      # 2. Search filters
      #
      vehicle_power_filter    = { 'vehicles.power'    => vehicle_power.to_i    }
      vehicle_capacity_filter = { 'vehicles.capacity' => vehicle_capacity.to_i }

      search.filter :term, vehicle_power_filter    unless vehicle_power.blank?
      search.filter :term, vehicle_capacity_filter unless vehicle_capacity.blank?

      # 3. Facets
      #
      search.facet 'power',    ( vehicle_power.blank?    ? {} : { :facet_filter => { :term => vehicle_power_filter } } )    do
        terms 'vehicles.power', :size => 1000, :all_terms => true
      end

      search.facet 'capacity', ( vehicle_capacity.blank? ? {} : { :facet_filter => { :term => vehicle_capacity_filter } } ) do
        terms 'vehicles.capacity', :size => 1000, :all_terms => true
      end

      # Pagination
      search.from ((params[:page].present? ? params[:page].to_i : 1).to_i * paginate_per) - paginate_per
      search.size paginate_per
      
      # DEBUG
      @json_query = search.to_json
      @curl_query = search.to_curl

      Rails.logger.debug("JSON") { "\n" + @json_query + "\n" }
      Rails.logger.debug("CURL") { "\n" + @curl_query + "\n" }
    end

    @categories = Category.includes(:makes).all
    @makes      = Make.includes(:models).all
    @models     = Model.all
    @groups     = PartGroup.all
  end

end
