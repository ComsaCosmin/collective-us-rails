class AddNameDescription < ActiveRecord::Migration
  def change
  	add_column :groups, :name, :string
  	add_column :groups, :description, :string
  end
end
