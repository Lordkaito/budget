class UsersController < ApplicationController
  before_action :authenticate_user!
  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find(params[:id])
  end

  # GET /users/new
  def new; end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create; end

  # PATCH/PUT /users/1 or /users/1.json
  def update; end

  # DELETE /users/1 or /users/1.json
  def destroy; end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user; end

  # Only allow a list of trusted parameters through.
  def user_params; end
end
