class RatingsController < ApplicationController
  before_filter :authenticate_user!

  def create
    @planet = Planet.find(params[:planet_id])
    @rating = Rating.find_by(user: current_user, planet: @planet)

    if @rating.nil?
      @rating = Rating.new
      @rating.user = current_user
      @rating.planet = @planet
    end

    @rating.score = params[:rating][:score]
    
    if @rating.save
      redirect_to planet_path(@planet), notice: 'Thanks for voting!'
    else
      redirect_to planet_path(@planet), notice: 'Could not save your vote.'
    end
  end

  def rating_params
    params.require(:rating).permit(:score)
  end
end

  

