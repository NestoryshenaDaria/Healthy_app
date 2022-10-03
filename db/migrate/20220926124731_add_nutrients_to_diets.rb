class AddNutrientsToDiets < ActiveRecord::Migration[7.0]
  def change
    add_column :diets, :nutrients, :jsonb
  end
end
