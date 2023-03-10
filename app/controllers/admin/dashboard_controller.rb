class Admin::DashboardController < ApplicationController
  def show
    @products = Products.all.order(created_at: :desc)
    @category = Category.all()
  end
end
