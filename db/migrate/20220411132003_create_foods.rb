class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.references :user, null: false, foreign_key: {to_table: 'users'}, index: true
      t.string :name
      t.string :measurement_unit
      t.decimal :price
      t.timestamps
    end
  end
end
