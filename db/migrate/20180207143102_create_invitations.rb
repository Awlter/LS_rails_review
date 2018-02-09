class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.integer :inviter_id
      t.string :recipient_email, :token
      t.timestamps
    end
  end
end
