class ReplaceAttributesInDogs < ActiveRecord::Migration[7.0]
  def change
    rename_column :dogs, :attributes, :distinctions
  end
end
