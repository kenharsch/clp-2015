class AddCritLowAndCritMedAndCritHighToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :crit_low_1, :boolean, :default => false
  	add_column :comments, :crit_med_1, :boolean, :default => false
  	add_column :comments, :crit_high_1, :boolean, :default => false
  	add_column :comments, :crit_low_2, :boolean, :default => false
  	add_column :comments, :crit_med_2, :boolean, :default => false
  	add_column :comments, :crit_high_2, :boolean, :default => false
  end
end
