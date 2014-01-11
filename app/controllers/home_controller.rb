class HomeController < ApplicationController

  def welcome
    if current_user
      render action: :home
    else
      #stuff
    end
  end

  def home
  end

end
