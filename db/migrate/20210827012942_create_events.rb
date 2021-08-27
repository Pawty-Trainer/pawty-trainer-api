class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.references :dog, foreign_key: true
      t.string :name
      t.boolean :completed
      t.datetime :event_datetime

      t.timestamps
    end
  end
end
