require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "given a product, test all fields save successfully" do
      it "product saves all fields" do
        @category = Category.new(:name => "Fern")
        @product = Product.new(:name => "Green Fern", :price => 14, :quantity => 5, :category => @category)
        @product.save
      end
  end
end
