class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.integer :number
      t.string :name
      t.string :ability
      t.references :owner, polymorphic: true, index: true
      t.timestamps
    end
  end
end
