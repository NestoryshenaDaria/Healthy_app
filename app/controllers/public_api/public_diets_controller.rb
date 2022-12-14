module PublicApi
class PublicDietsController < ApplicationController
  include MealPropertiesParser
  before_action :find_diet, only: %i[show]

   def index
     @diets = Diet.without_owner
   end

   def show
   end

   def new
     @diet = Diet.new
   end

   def create
     @diet = Diet.new(diet_params)
     calculate_diet_properties
     if @diet.save
       redirect_to public_diets_path(@diet)
     else
       render :new
   end
 end

   private

   def find_diet
     @diet = Diet.find(params[:id])
   end

   def diet_params
     params.require(:diet).permit(:name, :components, :description)
   end

   def calculate_diet_properties
      data = fetch_meal_properties(diet_params[:components])
      @diet.total_calories = data.fetch(:calories)
      @diet.nutrients = data.fetch(:nutrients)
   end
end
end
