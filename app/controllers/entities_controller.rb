class EntitiesController < ApplicationController
  before_action :authenticate_user!
  # GET /entities or /entities.json
  def index
  end

  # GET /entities/1 or /entities/1.json
  def show; end

  # GET /entities/new
  def new
  end

  # GET /entities/1/edit
  def edit; end

  # POST /entities or /entities.json
  def create

  end

  # PATCH/PUT /entities/1 or /entities/1.json
  def update
  end

  # DELETE /entities/1 or /entities/1.json
  def destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_entity
  end

  # Only allow a list of trusted parameters through.
  def entity_params
  end
end
