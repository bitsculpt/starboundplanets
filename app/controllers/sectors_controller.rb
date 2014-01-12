class SectorsController < AuthenticatedController

  def show
    @sector = Sector.find(params[:id])
  end

  def index
    @sectors = Sector.all
  end

end
