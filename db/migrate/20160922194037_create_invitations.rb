class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.belongs_to :member, required: true, foreign_key: { on_delete: :cascade }
      t.belongs_to :sender, required: true,
        foreign_key: { to_table: :members, on_delete: :cascade }
      t.string :email, limit: 128, required: true
      t.string :token, limit: 64, required: true
      t.string :status, limit: 16, required: true, default: :pending
      t.timestamps

      t.index :token, unique: true
      t.index [:email, :status]
    end
  end
end
