class RemoveOrganiserIdColumnFromReviews < ActiveRecord::Migration[6.1]
  def change
    remove_column :reviews, :organiser_id, :integer
  end
end
