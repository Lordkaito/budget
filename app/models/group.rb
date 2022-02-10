class Group < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :entities

  def show_entities_for_a_given_group
    @group = Group.find(params[:id])
    @entities = @group.entities
  end

  def show_amount_of_entities_for_a_given_group
    @group = Group.find(params[:id])
    @entities = @group.entities
    @amount = 0
    @entities.each do |entity|
      @amount += entity.amount
    end
    @amount
  end
end
