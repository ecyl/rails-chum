class AddLanguagesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :languages, :string
  end
end
