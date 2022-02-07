class GroupsController < ApplicationController
  before_action :authenticate_user!
  # GET /groups or /groups.json
  def index
  end

  # GET /groups/1 or /groups/1.json
  def show; end

  # GET /groups/new
  def new
  end

  # GET /groups/1/edit
  def edit; end

  # POST /groups or /groups.json
  def create
  end

  # PATCH/PUT /groups/1 or /groups/1.json
  def update
  end

  # DELETE /groups/1 or /groups/1.json
  def destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_group
  end

  # Only allow a list of trusted parameters through.
  def group_params
  end
end
