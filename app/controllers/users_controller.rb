class UsersController < ApplicationController
  # before_action :authenticate_user!
  # GET /users or /users.json
  def index
    @users = User.all
    @user = current_user
    return unless user_signed_in?

    @groups = @user.recent_added_groups
    @all_groups = @user.groups
    @total_amount = 0
    @all_groups.each do |group|
      @amount = 0
      @entities = group.entities
      @entities.each do |entity|
        @amount += entity.amount
      end
      @total_amount += @amount
    end
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
