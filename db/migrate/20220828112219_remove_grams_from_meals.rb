class RemoveGramsFromMeals < ActiveRecord::Migration[7.0]
  def change
    remove_column :meals, :grams, :integer
  end
end
