class AddIndicesForDogs < ActiveRecord::Migration[7.0]
  def change
    add_index :dogs, :breeds, name: 'dogs_breeds_idx', using: :gin
    add_index :dogs, :colors, name: 'dogs_colors_idx', using: :gin
    add_index :dogs, :environments, name: 'dogs_environments_idx', using: :gin
    add_index :dogs, :features, name: 'dogs_features_idx', using: :gin
    add_index :dogs, :pictures, name: 'dogs_pictures_idx', using: :gin
  end
end
