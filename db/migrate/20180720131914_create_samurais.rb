class CreateSamurais < ActiveRecord::Migration[5.2]
  def change
    create_table :samurais do |t|
      t.string :name
      t.integer :vp
      t.string :ability
      t.string :value
      t.integer :order
      t.references :owner, polymorphic: true, index: true
      t.timestamps
    end
  end
end
