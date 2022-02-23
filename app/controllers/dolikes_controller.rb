class DolikesController < ApplicationController
  def index
    @dolikes = current_user.dolikes
  end

end