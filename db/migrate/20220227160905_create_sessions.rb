class CreateSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :sessions do |t|
      t.date :date
      t.time :time
      t.string :status
      t.references :patient, null: false
      t.references :therapist, null: false

      t.timestamps
    end
  end
end
