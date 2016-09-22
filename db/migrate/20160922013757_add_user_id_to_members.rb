class AddUserIdToMembers < ActiveRecord::Migration[5.0]
  def change
    change_table :members do |t|
      t.belongs_to :user, required: false, index: true,
        foreign_key: { on_delete: :nullify }
    end
  end
end
