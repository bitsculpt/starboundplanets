class HomeController < ApplicationController
  def welcome
      @planets = Planet.all.order(created_at: :asc).limit(10)
  end
end
