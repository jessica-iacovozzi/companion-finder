class AddLatLngToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :latitude, :string
    add_column :organizations, :longitude, :string
  end
end
