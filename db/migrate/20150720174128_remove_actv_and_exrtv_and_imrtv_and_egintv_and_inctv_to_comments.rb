class RemoveActvAndExrtvAndImrtvAndEgintvAndInctvToComments < ActiveRecord::Migration
  def change
    remove_column :comments, :actv, :boolean
    remove_column :comments, :exrtv, :boolean
    remove_column :comments, :imrtv, :boolean
    remove_column :comments, :egintv, :boolean
    remove_column :comments, :inctv, :boolean
  end
end
