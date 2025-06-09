class CreatePartiantTrackings < ActiveRecord::Migration[8.0]
  def change
    create_table :partiant_trackings do |t|
      t.string :name
      t.string :room
      t.string :service_type
      t.references :department, foreign_key: true
      t.string :partiant_id
      t.string :phone
      t.string :insurance_company

      t.datetime :request_time
      t.datetime :send_time
      t.datetime :insurance_confirm_time
      t.string :insurance_status
      t.string :assignee
      t.string :note
      t.timestamps
    end
  end
end
