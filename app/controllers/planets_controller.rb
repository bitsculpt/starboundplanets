class PlanetsController < ApplicationController

  def new
    if user_signed_in?
      @planet = Planet.new
      @cluster = Cluster.find(params[:cluster_id])
    else
      redirect_to root_path
    end
  end

  def create
    @planet = Planet.new(planet_params)
    @planet.username = current_user.username
    if @planet.save
      redirect_to planet_path(@planet), notice: 'Cool! You created a planet!'
    else
      @cluster = Cluster.find(@planet.cluster_id)
      render "new"
    end
  end

  def index
    @planets = Planet.all
  end

  def show
    @planet = Planet.find(params[:id])
  end
  
  def edit
    @planet = Planet.find(params[:id])
  end

  def update
    @planet = Planet.find(params[:id])

    if @planet.update(planet_params)
      redirect_to @planet
    else
      render 'edit'
    end
  end



  private

  def planet_params
    params.require(:planet).permit(:biome, :threat_level, :username, :description, :cluster_id )
  end

end

