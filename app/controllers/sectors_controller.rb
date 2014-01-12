class SectorsController < AuthenticatedController

  def show
    @sector = Sector.find(params[:id])
  end

end
