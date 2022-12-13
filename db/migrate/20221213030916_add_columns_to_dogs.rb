class AddColumnsToDogs < ActiveRecord::Migration[7.0]
  def change
    add_reference :dogs, :organization, foreign_key: true
    add_column :dogs, :color, :string
    add_column :dogs, :attributes, :string
    add_column :dogs, :environment, :string
    add_column :dogs, :photos, :string
  end
end
