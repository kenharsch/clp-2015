class AddCritLowAndCritMedAndCritHighToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :crit_low, :boolean, :default => false
  	add_column :comments, :crit_med, :boolean, :default => false
  	add_column :comments, :crit_high, :boolean, :default => false
  end
end
