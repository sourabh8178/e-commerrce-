class DolikesController < ApplicationController
  # skip_before_action :authenticate_user!
  def index
    @dolikes = current_user.dolikes
  end

end