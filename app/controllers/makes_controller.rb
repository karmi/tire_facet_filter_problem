class MakesController < ApplicationController
  # GET /makes
  # GET /makes.json
  def index
    @makes = Make.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @makes }
    end
  end

  # GET /makes/1
  # GET /makes/1.json
  def show
    @make = Make.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @make }
    end
  end

  # GET /makes/new
  # GET /makes/new.json
  def new
    @make = Make.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @make }
    end
  end

  # GET /makes/1/edit
  def edit
    @make = Make.find(params[:id])
  end

  # POST /makes
  # POST /makes.json
  def create
    @make = Make.new(params[:make])

    respond_to do |format|
      if @make.save
        format.html { redirect_to @make, notice: 'Make was successfully created.' }
        format.json { render json: @make, status: :created, location: @make }
      else
        format.html { render action: "new" }
        format.json { render json: @make.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /makes/1
  # PUT /makes/1.json
  def update
    @make = Make.find(params[:id])

    respond_to do |format|
      if @make.update_attributes(params[:make])
        format.html { redirect_to @make, notice: 'Make was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @make.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /makes/1
  # DELETE /makes/1.json
  def destroy
    @make = Make.find(params[:id])
    @make.destroy

    respond_to do |format|
      format.html { redirect_to makes_url }
      format.json { head :no_content }
    end
  end
end
