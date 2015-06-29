class AddInteractionIndependentAndInteractionQuasiIntAndElaborativeAndNegotiatingToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :interaction_independent, :boolean, :default => false
  	add_column :comments, :interaction_quasi_int, :boolean, :default => false
  	add_column :comments, :elaborative, :boolean, :default => false
  	add_column :comments, :negotiating, :boolean, :default => false
  end
end
