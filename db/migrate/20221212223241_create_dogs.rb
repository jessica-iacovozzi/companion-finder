class CreateDogs < ActiveRecord::Migration[7.0]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :url
      t.string :breed
      t.string :gender
      t.string :size
      t.string :coat
      t.string :tags
      t.string :description

      t.timestamps
    end
  end
end
