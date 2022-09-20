require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
    it { should have_many(:dish_ingredients).through(:dishes) }
    it { should have_many(:ingredients).through(:dish_ingredients) }
  end

  describe '#instance methods' do
  before :each do
    @chef_1 = Chef.create!(name: "Chef Boyardee")

    @dish_1 = @chef_1.dishes.create!(name: "Raviolis", description: "Cheap pasta in ketchup sauce")
    @dish_2 = @chef_1.dishes.create!(name: "Lasagna", description: "Cardboard noodles with sawdust sprinkles")

    @ingredient_1 = Ingredient.create!(name: "Ketchup Sauce", calories: 1000)
    @ingredient_2 = Ingredient.create!(name: "Cheap Pasta", calories: 2000)

    @ingredient_3 = Ingredient.create!(name: "Cardboard Noodles", calories: 500)
    @ingredient_4 = Ingredient.create!(name: "Sawdust Sprinkles", calories: 1000)

    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_2)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_3)
    DishIngredient.create!(dish: @dish_1, ingredient: @ingredient_4)

    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_1)
    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_2)
    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_3)
    DishIngredient.create!(dish: @dish_2, ingredient: @ingredient_4)
  end
    it 'ingredient_list' do
      expect(@chef_1.ingredient_list).to eq([@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_4])
    end
  end
end