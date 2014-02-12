class RacesController < ApplicationController
  before_action :set_race, only: [:show, :edit, :update, :destroy]

  # GET /races
  # GET /races.json
  def index
    @races = Race.all
  end

  # GET /races/1
  # GET /races/1.json
  def show
    session[:race_id] = @race.id

    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info(session[:race_id])
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
    logger.info("- - - - - - - - - - - - - - - - - - -- - - -")
  end

  # GET /races/new
  def new
    if current_user and current_user.isRunner
      @race = current_user.races.new
    else
      redirect_to root_url
    end
  end

  # GET /races/1/edit
  def edit
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
