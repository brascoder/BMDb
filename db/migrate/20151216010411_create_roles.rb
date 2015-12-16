class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.belongs_to :movie, index: true
      t.belongs_to :actor, index: true

      t.timestamps null: false
    end
  end
end
