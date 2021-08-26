class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.references :user, foreign_key: true
      t.string :breed
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end
