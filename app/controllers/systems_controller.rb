class SystemsController < ApplicationController

  def new
    @system = System.new
  end

  def create
    @system = System.new(system_params)
    if @system.save
      redirect_to system_path(@system), notice: 'Cool! You created a system!'
    else
      render :new
    end
  end

  private

  def system_params
    params.require(:system).permit(:name, :x_coord, :y_coord, :sector_id )
  end
end
