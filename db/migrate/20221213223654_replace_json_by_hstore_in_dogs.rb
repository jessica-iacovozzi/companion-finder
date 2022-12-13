class ReplaceJsonByHstoreInDogs < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :breeds, :hstore, default: {}, null: false
    add_column :dogs, :colors, :hstore, default: {}, null: false
    add_column :dogs, :environments, :hstore, default: {}, null: false
    add_column :dogs, :features, :hstore, default: {}, null: false
    add_column :dogs, :pictures, :hstore, default: {}, null: false
    add_column :dogs, :qualities, :text, array: true, default: []
  end
end
