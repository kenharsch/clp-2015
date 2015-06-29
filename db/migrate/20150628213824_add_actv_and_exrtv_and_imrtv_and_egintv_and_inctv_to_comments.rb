class AddActvAndExrtvAndImrtvAndEgintvAndInctvToComments < ActiveRecord::Migration
  def change
  	add_column :comments, :actv, :boolean, :default => false
  	add_column :comments, :exrtv, :boolean, :default => false
  	add_column :comments, :imrtv, :boolean, :default => false
  	add_column :comments, :egintv, :boolean, :default => false
  	add_column :comments, :inctv, :boolean, :default => false
  end
end
