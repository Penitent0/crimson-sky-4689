require 'rails_helper'

RSpec.describe 'Dish Show Page' do

  # As a visitor
  # When I visit a dish's show page
  # I see the dish’s name and description
  # And I see a list of ingredients for that dish
  # And I see the chef's name.

  describe 'User Story 1 - When I visit a dishs show page' do
    before :each do
      @chef_1 = chef.create!(name: "Chef Boyardee")

      @dish_1 = chef_1.dishes.create!(name: "Raviolis", description: "Cheap pasta in ketchup sauce")
      @dish_2 = chef_1.dishes.create!(name: "Lasagna", description: "Cardboard noodles with sawdust sprinkles")

      @ingredient_1 = dish_1.ingredients.create!(name: "Ketchup Sauce", calories: 1000)
      @ingredient_2 = dish_1.ingredients.create!(name: "Cheap Pasta", calories: 2000)

      @ingredient_3 = dish_2.ingredients.create!(name: "Cardboard Noodles", calories: 500)
      @ingredient_4 = dish_2.ingredients.create!(name: "Sawdust Sprinkles", calories: 1000)
    end

    it 'I see the dish’s name and description' do
      visit dishes_path(@dish_1)
      
      within "#dish-info" do
        expect(page).to have_content(@dish_1.name)
        expect(page).to have_content(@dish_1.description)
        expect(page).to have_content(@ingredient_1.name)
        expect(page).to have_content(@ingredient_2.name)
        expect(page).to have_content(@chef_1.name)
      end
      
    end

    it 'And I see a list of ingredients for that dish' do

    end

    it 'And I see the chefs name.' do


    end
  end
end