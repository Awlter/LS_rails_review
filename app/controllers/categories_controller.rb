class CategoriesController < ApplicationController
  before_action do
    require_login
  end

  def index
    @categories = Category.all
  end
end