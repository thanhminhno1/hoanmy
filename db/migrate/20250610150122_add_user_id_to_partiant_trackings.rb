class AddUserIdToPartiantTrackings < ActiveRecord::Migration[8.0]
  def change
    add_reference :partiant_trackings, :user, null: false, foreign_key: true
  end
end
