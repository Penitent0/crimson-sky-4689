require 'rails_helper'

RSpec.describe 'Chef Show Page' do
  before :each do
    @chef_1 = Chef.create!(name: "Chef Boyardee")
    @chef_2 = Chef.create!(name: "Little Debbie")

    @dish_1 = @chef_1.dishes.create!(name: "Raviolis", description: "Cheap pasta in ketchup sauce")
    @dish_2 = @chef_1.dishes.create!(name: "Lasagna", description: "Cardboard noodles with sawdust sprinkles")

    @dish_3 = @chef_2.dishes.create!(name: "Brownies", description: "Chocolate flavored concrete bricks")
    @dish_4 = @chef_2.dishes.create!(name: "Lemon Bars", description: "Lemon Pledge glazed wood blocks")

    @ingredient_1 = @dish_1.ingredients.create!(name: "Ketchup Sauce", calories: 1000)
    @ingredient_2 = @dish_1.ingredients.create!(name: "Cheap Pasta", calories: 2000)

    @ingredient_3 = @dish_2.ingredients.create!(name: "Cardboard Noodles", calories: 500)
    @ingredient_4 = @dish_2.ingredients.create!(name: "Sawdust Sprinkles", calories: 1000)

    @ingredient_5 = @dish_3.ingredients.create!(name: "Chocolate Flavoring", calories: 200)
    @ingredient_6 = @dish_3.ingredients.create!(name: "Concrete Blocks", calories: 10)

    @ingredient_7 = @dish_4.ingredients.create!(name: "Lemon Pledge", calories: 0)
    @ingredient_8 = @dish_4.ingredients.create!(name: "Wood Blocks", calories: 400)
  end

  # As a visitor
  # When I visit a chef's show page
  # I see the name of that chef
  # And I see a link to view a list of all ingredients that this chef uses in their dishes.
  # When I click on that link
  # I'm taken to a chef's ingredient index page
  # and I can see a unique list of names of all the ingredients that this chef uses.

  describe 'User Story 3 - When I visit a chefs show page' do
    it 'I see the name of that chef' do
      visit chef_path(@chef_1)
    end

    it 'And I see a link to view a list of all ingredients that this chef uses in their dishes' do

    end

    it 'When I click on that link Im taken to a chefs ingredient index page' do

    end

    it 'and I can see a unique list of names of all the ingredients that this chef uses.' do

    end
  end
end