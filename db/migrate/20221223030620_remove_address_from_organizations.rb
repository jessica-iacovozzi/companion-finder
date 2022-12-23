class RemoveAddressFromOrganizations < ActiveRecord::Migration[7.0]
  def change
    remove_column :organizations, :address
  end
end
