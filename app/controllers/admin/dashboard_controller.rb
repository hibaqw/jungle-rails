class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "Jungle", password: "book"
  def show
    @products = Product.all.order(created_at: :desc)
    @category = Category.all()
  end
end
