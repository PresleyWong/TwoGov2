class AddColumnsToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :gender, :string
  	add_column :posts, :age_group, :string
  end
end
