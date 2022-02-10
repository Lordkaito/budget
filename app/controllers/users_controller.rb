class UsersController < ApplicationController
  # before_action :authenticate_user!
  # GET /users
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
end
