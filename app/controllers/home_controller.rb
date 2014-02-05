class HomeController < ApplicationController
  def home
    if user_signed_in?
      @planets = Planet.all.order(created_at: :desc).limit(10)
    else
      redirect_to welcome_path
    end
  end

  def welcome
    @planets = Planet.all.order(created_at: :desc).limit(10)
  end
end
