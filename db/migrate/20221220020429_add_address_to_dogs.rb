class AddAddressToDogs < ActiveRecord::Migration[7.0]
  def change
    add_column :dogs, :address, :string
  end
end
