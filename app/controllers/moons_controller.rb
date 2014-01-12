class MoonsController < ApplicationController

  def new
    if user_signed_in?
      @moon = Moon.new
      @cluster = Cluster.find(params[:cluster_id])
    else
      redirect_to root_path
    end
  end

  def create
    @moon = Moon.new(moon_params)
    @moon.username = current_user.username
    if @moon.save
      redirect_to moon_path(@moon), notice: 'Cool! You created a moon!'
    else
      @cluster = Cluster.find(@moon.cluster_id)
      render "new"
    end
  end

  def show
    @moon = Moon.find(params[:id])
  end


  private

  def moon_params
    params.require(:moon).permit(:name, :biome, :threat_level, :description, :cluster_id )
  end
end
