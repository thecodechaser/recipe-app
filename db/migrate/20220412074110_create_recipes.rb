class CreateRecipes < ActiveRecord::Migration[7.0]
  def change
    create_table :recipes do |t|
      t.references :user, null: false, foreign_key: { to_table: 'users'}, index: true 
      t.string :name
      t.string :prepration_time
      t.string :cooking_time
      t.text :description
      t.boolean :public, default: false
      t.timestamps
    end
  end
end
