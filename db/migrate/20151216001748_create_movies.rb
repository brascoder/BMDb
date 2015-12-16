class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :title, index: true
      t.string :genre, index: true
      t.text :description

      t.timestamps null: false
    end
  end
end
