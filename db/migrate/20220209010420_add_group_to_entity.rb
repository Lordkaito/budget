class AddGroupToEntity < ActiveRecord::Migration[7.0]
  def change
    add_reference :entities, :group, null: true, foreign_key: true
  end
end
