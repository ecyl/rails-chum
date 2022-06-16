class AddOrganiserIdToReviews < ActiveRecord::Migration[6.1]
  def change
    add_column :reviews, :organiser_id, :integer
  end
end
