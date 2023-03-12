require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "given a product, test all fields save successfully" do
      it "product saves all fields" do
        @category = Category.new(:name => "Fern")
        @product = Product.new(:name => "Green Fern", :price => 14, :quantity => 5, :category => @category)
        @product.name = nil
      end

      it "validate presence of name in product" do
        @category = Category.new(:name => "Shrub")
        @product = Product.new(:name => nil, :price => 14, :quantity => 5, :category => @category)
        @product.valid?
        expect(@product.errors[:name]).to include( "can't be blank")
  
        @product.name = "Monstera"
        @product.valid?
        expect(@product.errors[:name]).not_to include("can't be blank")

      end

      it "validate presence of quantity in product" do
        @category = Category.new(:name => "Shrub")
        @product = Product.new(:name => "Monstera", :price => 14, :quantity => nil, :category => @category)
        @product.valid?
        expect(@product.errors[:quantity]).to include("can't be blank")
  
        @product.quantity = "3"
        @product.valid?
        expect(@product.errors[:quantity]).not_to include("can't be blank")
      end

      it "validate presence of price in product" do
        @category = Category.new(:name => "Shrub")
        @product = Product.new(:name => "Monstera", :price_cents => nil, :quantity => 3, :category => @category)
        @product.valid?
        expect(@product.errors[:price]).to include("is not a number")
        @product.price_cents = "79.00"
        @product.valid?
        expect(@product.errors[:price]).not_to include("is not a number")
      end
      it "validate presence of category in product" do
        @product = Product.new(:name => "Monstera", :price_cents => 79.00, :quantity => 3, :category => nil)
        @product.valid?
        expect(@product.errors[:category]).to include("can't be blank")
        @category = Category.new(:name => "Shrub")
        @product.category = @category
        @product.valid?
        expect(@product.errors[":category"]).not_to include("can't be blank")
      end

  end
end
end
