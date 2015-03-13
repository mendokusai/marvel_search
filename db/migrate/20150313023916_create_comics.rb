class CreateComics < ActiveRecord::Migration
  def change
    create_table :comics do |t|
      t.string :index

      t.timestamps null: false
    end
  end
end
