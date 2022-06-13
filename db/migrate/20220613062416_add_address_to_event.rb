class AddAddressToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :address, :string
  end
end
