class HomeController < ApplicationController
# need to refactor this controller and maybe some routes
  def welcome
    if current_user
      @planets = Planet.all.order(created_at: :asc).limit(4)
      @combined = Sector.name + Cluster.name 
      #render action: :home
    else
      @planets = Planet.all.order(created_at: :asc).limit(4)
      
    end
  end

  def home
 binding.pry
  end

end
