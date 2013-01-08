class MainController < ApplicationController
  def index
    render :about if (current_user == nil)
  end
end
