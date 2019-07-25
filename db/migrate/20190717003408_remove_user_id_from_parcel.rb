class RemoveUserIdFromParcel < ActiveRecord::Migration[5.2]
  def change
    remove_column :parcels, :user_id
  end
end
