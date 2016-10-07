class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :address
      t.text :description
      t.text :search_tag
      t.string :activity_type
      t.string :language_type
      t.string :duration_type
     
      t.float :latitude
      t.float :longitude

      t.references :user, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
