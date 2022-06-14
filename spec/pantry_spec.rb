require './lib/ingredient'
require './lib/pantry'

RSpec.describe Pantry do
  before do
    @pantry = Pantry.new
    @ingredient1 = Ingredient.new({name: "Cheese", unit: "oz", calories: 50})
    @ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 200})
  end

  it 'exists & has attributes' do
    expect(@pantry).to be_a(Pantry)
    expect(@pantry.stock).to eq({})
  end

  it 'can do a stock check' do
    expect(@pantry.stock_check(@ingredient1)).to eq(0)
  end

  it 'can restock ingredients' do
    @pantry.restock(@ingredient1, 5)
    @pantry.restock(@ingredient1, 10)
    
    expect(@pantry.stock_check(@ingredient1)).to eq(15)

    @pantry.restock(@ingredient2, 7)
    expect(@pantry.stock_check(@ingredient2)).to eq(7)
  end
end