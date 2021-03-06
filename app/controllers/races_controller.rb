class RacesController < ApplicationController
  before_action :set_race, only: [:show, :edit, :update, :destroy]

  # GET /races
  # GET /races.json
  def index
    @races = Race.all

    @racesjson = @races.as_json( :include => { :playlist => { :include => { :songs => {} } } } )
    @usersjson = User.all().as_json

    respond_to do |format|
      format.html
      format.json { render :json => @races, :include => { :playlist => { :include => { :songs => {} } } } }
    end
  end

  # GET /races/1
  # GET /races/1.json
  def show
    session[:race_id] = @race.id
  end

  # GET /races/new
  def new
    if current_user and current_user.isRunner
      response.headers['X-CSRF-Token'] = form_authenticity_token
      @race = current_user.races.new
    else
      redirect_to root_url
    end
  end

  # GET /races/1/edit
  def edit
    if current_user != @race.user
      return respond_to do |format|
          format.json { render :json => [], :status => :unauthorized }
          format.html { render :file => "public/403.html", :status => :unauthorized, :layout => false }
        end
    end
  end

  # POST /races
  # POST /races.json
  def create
    @race = Race.new(race_params)

    respond_to do |format|
      if @race.save
        format.html { redirect_to @race, notice: 'Race was successfully created.' }
        format.json { render action: 'show', status: :created, location: @race }
      else
        format.html { render action: 'new' }
        format.json { render json: @race.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /races/1
  # PATCH/PUT /races/1.json
  def update
    respond_to do |format|
      if @race.update(race_params)
        format.html { redirect_to @race, notice: 'Race was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @race.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /races/1
  # DELETE /races/1.json
  def destroy
    @race.destroy
    respond_to do |format|
      format.html { redirect_to races_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_race
      @race = Race.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def race_params
      params.require(:race).permit(:name, :description, :date, :target, :mainImage, :secondImage, :thirdImage, :route_id, :user_id, :playlist_id)
    end
end
