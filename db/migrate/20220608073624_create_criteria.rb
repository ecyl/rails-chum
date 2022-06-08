class CreateCriteria < ActiveRecord::Migration[6.1]
  def change
    create_table :criteria do |t|
      t.string :title
      t.integer :min_age
      t.integer :max_age
      t.string :restricted_gender

      t.timestamps
    end
  end
end
