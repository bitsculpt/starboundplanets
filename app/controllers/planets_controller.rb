class PlanetsController < ApplicationController

  def new
    if user_signed_in?
      @planet = Planet.new
    else
      redirect_to root_path
    end
  end

  def create
    @planet = current_user.planets.build(planet_params)
    @planet.user = current_user
    if @planet.save
      redirect_to planet_path(@planet), notice: 'Cool! You created a planet!'
    else
      render "new"
    end
  end

  def index
    if params[:user_id]
      @user = User.find(params[:user_id])
      @planets = @user.planets
    else
      @planets = Planet.all
    end
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
    params.require(:planet).permit(:biome, :threat_level, :description, :sector_id,
                                   :system, :orbit, :name, :x_coord, :y_coord )
  end

end

