class CategorysController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @categorys = Category.all
  end

end