class CreatePilots < ActiveRecord::Migration[7.0]
  def change
    create_table :pilots do |t|
      t.string :name
      t.string :document

      t.timestamps
    end
  end
end
