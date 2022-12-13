class RemoveJsonInDogs < ActiveRecord::Migration[7.0]
  def change
    remove_column :dogs, :breed, :json
    remove_column :dogs, :color, :json
    remove_column :dogs, :distinctions, :json
    remove_column :dogs, :environment, :json
    remove_column :dogs, :photos, :string
    remove_column :dogs, :tags, :string
  end
end
