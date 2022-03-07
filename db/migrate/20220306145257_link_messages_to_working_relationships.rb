class LinkMessagesToWorkingRelationships < ActiveRecord::Migration[6.1]
  def change
    remove_reference :messages, :recipient
    add_reference :messages, :working_relationship, foreign_key: true, null: false
  end
end
