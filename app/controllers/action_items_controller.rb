class ActionItemsController < ApplicationController
  # GET /action_items
  # GET /action_items.json
  def index
    @action_items = ActionItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @action_items }
    end
  end

  # GET /action_items/1
  # GET /action_items/1.json
  def show
    @action_item = ActionItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @action_item }
    end
  end

  # GET /action_items/new
  # GET /action_items/new.json
  def new
    @action_item = ActionItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @action_item }
    end
  end

  # GET /action_items/1/edit
  def edit
    @action_item = ActionItem.find(params[:id])
  end

  # POST /action_items
  # POST /action_items.json
  def create
    @action_item = ActionItem.new(params[:action_item])

    respond_to do |format|
      if @action_item.save
        format.html { redirect_to @action_item, notice: 'Action item was successfully created.' }
        format.json { render json: @action_item, status: :created, location: @action_item }
      else
        format.html { render action: "new" }
        format.json { render json: @action_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /action_items/1
  # PUT /action_items/1.json
  def update
    @action_item = ActionItem.find(params[:id])

    respond_to do |format|
      if @action_item.update_attributes(params[:action_item])
        format.html { redirect_to @action_item, notice: 'Action item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @action_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /action_items/1
  # DELETE /action_items/1.json
  def destroy
    @action_item = ActionItem.find(params[:id])
    @action_item.destroy

    respond_to do |format|
      format.html { redirect_to action_items_url }
      format.json { head :ok }
    end
  end
end
