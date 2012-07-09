class PartGroupsController < ApplicationController
  # GET /part_groups
  # GET /part_groups.json
  def index
    @part_groups = PartGroup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @part_groups }
    end
  end

  # GET /part_groups/1
  # GET /part_groups/1.json
  def show
    @part_group = PartGroup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @part_group }
    end
  end

  # GET /part_groups/new
  # GET /part_groups/new.json
  def new
    @part_group = PartGroup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @part_group }
    end
  end

  # GET /part_groups/1/edit
  def edit
    @part_group = PartGroup.find(params[:id])
  end

  # POST /part_groups
  # POST /part_groups.json
  def create
    @part_group = PartGroup.new(params[:part_group])

    respond_to do |format|
      if @part_group.save
        format.html { redirect_to @part_group, notice: 'Part group was successfully created.' }
        format.json { render json: @part_group, status: :created, location: @part_group }
      else
        format.html { render action: "new" }
        format.json { render json: @part_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /part_groups/1
  # PUT /part_groups/1.json
  def update
    @part_group = PartGroup.find(params[:id])

    respond_to do |format|
      if @part_group.update_attributes(params[:part_group])
        format.html { redirect_to @part_group, notice: 'Part group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @part_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_groups/1
  # DELETE /part_groups/1.json
  def destroy
    @part_group = PartGroup.find(params[:id])
    @part_group.destroy

    respond_to do |format|
      format.html { redirect_to part_groups_url }
      format.json { head :no_content }
    end
  end
end
