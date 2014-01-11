class SystemsController < ApplicationController

  def new
    @system = System.new
    @sector = Sector.find(params[:sector_id])
  end

  def create
    @system = System.new(system_params)
    if @system.save
      redirect_to system_path(@system), notice: 'Cool! You created a system!'
    else
      @sector = Sector.find(@system.sector_id)
      render "new"
    end
  end

  def show
    @system = System.find(params[:id])
  end

  private

  def system_params
    params.require(:system).permit(:name, :x_coord, :y_coord, :sector_id )
  end
end
