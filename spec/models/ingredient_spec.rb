require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  describe 'relationships' do
    it {should have_many(:dish_ingedients) }
    it {should have_many(:dishes).through(:dish_ingedients) }

  end
end