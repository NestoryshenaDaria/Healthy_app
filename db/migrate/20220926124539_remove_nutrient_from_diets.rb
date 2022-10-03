class RemoveNutrientFromDiets < ActiveRecord::Migration[7.0]
  def change
    remove_column :diets, :nutrient, :string
  end
end
