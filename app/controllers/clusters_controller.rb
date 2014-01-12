class ClustersController < AuthenticatedController

  def new
    @cluster = Cluster.new
    @system = System.find(params[:system_id])
  end

  def create
    @cluster = Cluster.new(cluster_params)
    if @cluster.save
      redirect_to cluster_path(@cluster), notice: 'Cool! You created a cluster!'
    else
      @system = System.find(@cluster.system_id)
      render "new"
    end
  end

  def show
    @cluster = Cluster.find(params[:id])
  end

  private

  def cluster_params
    params.require(:cluster).permit(:name, :system_id )
  end

end
