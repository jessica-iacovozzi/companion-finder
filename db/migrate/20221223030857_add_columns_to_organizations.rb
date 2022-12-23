class AddColumnsToOrganizations < ActiveRecord::Migration[7.0]
  def change
    add_column :organizations, :city, :string
    add_column :organizations, :postcode, :string
    add_column :organizations, :picture, :string
    add_column :organizations, :org_id, :string
  end
end
