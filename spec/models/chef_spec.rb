require 'rails_helper'

RSpec.describe Chef, type: :model do
  describe "validations" do
    it {should validate_presence_of :name}
  end
  describe "relationships" do
    it {should have_many :dishes}
  end

  describe '#instance methods' do
  before :each do
    @chef_1 = Chef.create!(name: "Chef Boyardee")

    @dish_1 = @chef_1.dishes.create!(name: "Raviolis", description: "Cheap pasta in ketchup sauce")
    @dish_2 = @chef_1.dishes.create!(name: "Lasagna", description: "Cardboard noodles with sawdust sprinkles")

    @ingredient_1 = @dish_1.ingredients.create!(name: "Ketchup Sauce", calories: 1000)
    @ingredient_2 = @dish_1.ingredients.create!(name: "Cheap Pasta", calories: 2000)

    @ingredient_3 = @dish_2.ingredients.create!(name: "Cardboard Noodles", calories: 500)
    @ingredient_4 = @dish_2.ingredients.create!(name: "Sawdust Sprinkles", calories: 1000)
  end
    it 'ingredient_list' do
      expect(@chef_1.ingredient_list).to eq([@ingredient_1, @ingredient_2, @ingredient_3, @ingredient_4])
    end
  end
end