class CreateWorkingRelationships < ActiveRecord::Migration[6.1]
  def change
    create_table :working_relationships do |t|
      t.references :patient, null: false
      t.references :therapist, null: false
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
