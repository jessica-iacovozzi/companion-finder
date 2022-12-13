class ReplaceSomeTypesByJsonInDogs < ActiveRecord::Migration[7.0]
  def up
    change_column :dogs, :breed, :jsonb, using: 'CAST(breed AS JSON)'
    change_column :dogs, :color, :jsonb, using: 'CAST(color AS JSON)'
    change_column :dogs, :distinctions, :jsonb, using: 'CAST(distinctions AS JSON)'
    change_column :dogs, :environment, :jsonb, using: 'CAST(environment AS JSON)'
  end

  def down
    change_column :dogs, :breed, :string
    change_column :dogs, :color, :string
    change_column :dogs, :distinctions, :string
    change_column :dogs, :environment, :string
  end
end
