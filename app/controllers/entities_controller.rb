class EntitiesController < ApplicationController
  before_action :authenticate_user!
  # GET /entities or /entities.json
  def index
    @all_entities = Entity.all
  end

  # GET /entities/1 or /entities/1.json
  def show; end

  # GET /entities/new
  def new
    @groups = Group.all
    @entity = Entity.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create
    @entity = current_user.entities.new(entity_params)

    respond_to do |format|
      format.html do
        if @entity.save
          flash[:success] = 'Entity was successfully created.'
          redirect_to root_path
        else
          flash[:notice] = 'Entity was not created.'
          render :new
        end
      end
    end
  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update; end

  # DELETE /entities/1 or /entities/1.json
  def destroy; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity; end

  # Only allow a list of trusted parameters through.
  def entity_params
    params.require(:entity).permit(:name, :amount, :group_id)
  end
end
