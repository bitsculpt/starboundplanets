class PlanetsController < ApplicationController

  def new
    @planet = Planet.new
    @cluster = Cluster.find(params[:cluster_id])
  end

  def create
    @planet = Planet.new(planet_params)
    if @planet.save
      redirect_to planet_path(@planet), notice: 'Cool! You created a planet!'
    else
      @cluster = Cluster.find(@planet.cluster_id)
      render "new"
    end
  end

  def planet_params
    params.require(:planet).permit(:biome, :threat_level, :username, :description, :cluster_id )
  end
  


end

