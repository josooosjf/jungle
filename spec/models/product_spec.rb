require 'rails_helper'



RSpec.describe Product, type: :model do
  describe 'Validations' do

    before(:each) do
      @category = Category.new(name: "cool")
      @product = Product.new({
        name:  'Women\'s Zebra pants',
        description: ("very cool"),
        image: ('apparel2.jpg'),
        quantity: 18,
        price: 124.99,
        category: @category
      })
      @category.save!
      @product.save!
    end

    it 'should validate that the error is found within the .errors.full_messages array ' do
      @product.name = nil
      @product.valid?
      expect(@product.errors.full_messages).to eq(["Name can't be blank"])
    end

    it 'should validate name is present' do
    expect(@product.name).to be_present
    end

    it 'should validate price is present' do
      expect(@product.price).to be_present
    end

    it 'should validate qantity is present' do
      expect(@product.quantity).to be_present
    end

    it 'should validate category is present' do
      expect(@product.category).to be_present
    end
  end

end
