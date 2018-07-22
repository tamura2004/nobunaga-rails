class CreateDices < ActiveRecord::Migration[5.2]
  def change
    create_table :dices do |t|
      t.integer :number
      t.string :color
      t.references :owner, polymorphic: true, index: true
      t.timestamps
    end
  end
end
