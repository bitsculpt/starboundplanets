class AsteroidFieldsController < ApplicationController

  def new
    @asteroid_field = AsteroidField.new
    @cluster = Cluster.find(params[:cluster_id])
  end

  def create
    @asteroid_field = AsteroidField.new(asteroid_field_params)
    if @asteroid_field.save
      redirect_to asteroid_field_path(@asteroid_field), notice: 'Cool! You created an asteroid field!'
    else
      @cluster = Cluster.find(@asteroid_field.cluster_id)
      render "new"
    end
  end

  def show
    @asteroid_field = AsteroidField.find(params[:id])
  end

  private

  def asteroid_field_params
    params.require(:asteroid_field).permit(:name, :description, :threat_level, :cluster_id )
  end

end
