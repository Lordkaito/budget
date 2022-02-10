class GroupsController < ApplicationController
  before_action :authenticate_user!
  # GET /groups or /groups.json
  def index
    @all_groups = current_user.groups
    @total_amount = 0
    @all_groups.each do |group|
      @entities = group.entities
      @entities.each do |entity|
        @total_amount += entity.amount
      end
    end
  end

  # GET /groups/1 or /groups/1.json
  def show
    @group = Group.find(params[:id])
    @entities = @group.entities
    @group_amount = 0
    @entities.each do |entity|
      @group_amount += entity.amount
    end
  end

  # GET /groups/new
  def new
    @user = current_user
    @group = Group.new
    respond_to do |format|
      format.html { render :new }
    end
  end

  # POST /groups or /groups.json
  def create
    @group = current_user.groups.new(group_params)

    respond_to do |format|
      format.html do
        if @group.save
          flash[:success] = 'Group was successfully created.'
          redirect_to root_path
        else
          flash[:notice] = 'Group was not created.'
          render :new
        end
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
