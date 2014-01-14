class HomeController < ApplicationController
# need to refactor this controller and maybe some routes
  def welcome
    if current_user
      @planets = Planet.all.order(created_at: :asc).limit(4)
      @moons =   Moon.all.order(created_at: :asc).limit(4)
      @asteroid_fields = AsteroidField.all.order(created_at: :asc).limit(4)
      render action: :home
    else
      @planets = Planet.all.order(created_at: :asc).limit(4)
      @moons =   Moon.all.order(created_at: :asc).limit(4)
      @asteroid_fields = AsteroidField.all.order(created_at: :asc).limit(4)
    end
  end

  def home
 
  end

end
