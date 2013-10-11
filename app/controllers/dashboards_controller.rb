class DashboardsController < ApplicationController
  def index
    @dashboards = Dashboard.all

    #render :json => @dashboards

    respond_to do |format|
      format.html
      format.json { render json: @dashboards }
    end

  end

  def show
    @dashboard = Dashboard.find((params[:id]))
    @widgets1 = @dashboard.widgets.order("sequence")
    @widget = Widget.new

    json_dash = Hash.new

    json_dash[:id] = @dashboard.id
    json_dash[:widgets] = @widgets1

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: json_dash }
    end

  end


  def updateorder
    @dashboard = Dashboard.find((params[:id]))
    print params

    params[:item].each_index do |index|
      widget = @dashboard.widgets.find(params[:item][index])
      widget.sequence=index
      widget.save
    end

    render :inline => ""
  end


  def new
    @dashboard = Dashboard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dashboard }
    end
  end

  def create
    @dashboard = Dashboard.new(dashboard_params)

    respond_to do |format|
      if @dashboard.save
        format.html { redirect_to @dashboard, notice: 'Dashboard: '+@dashboard.title+' was successfully created.' }
        format.json { render json: @dashboard, status: :created, location: @customer }
      else
        format.html { render action: "new" }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /dashboards/1/edit
  def edit
    @dashboard = Dashboard.find(params[:id])
  end

  # PATCH/PUT /dashboards/1
  # PATCH/PUT /dashboards/1.json
  def update
    @dashboard = Dashboard.find(params[:id])
    respond_to do |format|
      if @dashboard.update(dashboard_params)
        format.html { redirect_to @dashboard, notice: 'Dashboard was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @dashboard.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dashboards/1
  # DELETE /dashboards/1.json
  def destroy
    @dashboard = Dashboard.find(params[:id])
    @dashboard.destroy
    respond_to do |format|
      format.html { redirect_to dashboards_url }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_dashboard
    @dashboard = Dashboard.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def dashboard_params
    params.require(:dashboard).permit(:title)
  end

end
