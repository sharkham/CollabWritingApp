class CreateMemberships < ActiveRecord::Migration[6.0]
  def change
    create_table :memberships do |t|
      t.belongs_to :novel, null: false, foreign_key: true
      t.belongs_to :user, null: false, foreign_key: true
      t.string :role

    end
  end
end
