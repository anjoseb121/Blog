class ChangeColumnPermissionLevelFromStringToIntegerFixingWhatUrielCrash < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :permission_level, :integer
  	add_column :users, :permission_level, :integer, default: 1
  end
end
