class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :status
      t.integer :user_id 
      t.integer :invitee_id
      t.timestamps null: false
    end
  end
end
