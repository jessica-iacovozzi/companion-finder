class ChangeDescriptionToTextInDogs < ActiveRecord::Migration[7.0]
  def change
    change_column :dogs, :description, :text
  end
end
