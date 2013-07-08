class AddDentistFieldsToUser < ActiveRecord::Migration
  def change
    add_column :spree_users, :dental_license_number, :string
  end
end
