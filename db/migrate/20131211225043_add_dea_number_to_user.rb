class AddDeaNumberToUser < ActiveRecord::Migration
  def change
    add_column :spree_users, :dea_number, :string
  end
end
