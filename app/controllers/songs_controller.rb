class SongsController < ApplicationController
  before_action :set_song, only: [:show, :edit, :update, :destroy]

  before_filter :find_playlist, only: [:create, :search]

  def search
    song = params[:song]
    search = MetaSpotify::Track.search(song)
    logger.info(search)
    @results = search

    @donationId = User.find(session[:user_id]).donations.includes(:song).where(songs:{id: nil}).first.id

    logger.info("& & & & & & & & & & & & & & & & & & & & &")
    logger.info("& & & & & & & & & & & & & & & & & & & & &")
    logger.info("& & & & & & & & & & & & & & & & & & & & &")
    logger.info("& & & & & & & & & & & & & & & & & & & & &")
    logger.info("& & & & & & & & & & & & & & & & & & & & &")
    logger.info("& & & & & & & & & & & & & & & & & & & & &")
    logger.info("& & & & & & & & & & & & & & & & & & & & &")
    logger.info("& & & & & & & & & & & & & & & & & & & & &")
    logger.info("& & & & & & & & & & & & & & & & & & & & &")
    logger.info("& & & & & & & & & & & & & & & & & & & & &")
    logger.info(@donationId)
  end

  # GET /songs
  # GET /songs.json
  def index
    @songs = Song.all
  end

  # GET /songs/1
  # GET /songs/1.json
  def show
  end

  # GET /songs/new
  def new
    @song = Song.new
  end

  # GET /songs/1/edit
  def edit
  end

  # POST /songs
  # POST /songs.json
  def create
    @song = Song.new()
    @song.playlists << @playlist
    @song.donation_id = params[:donation_id]
    @song.spotify_id = params[:spotify_id]
    @song.name = params[:song]
    @song.artist = params[:artist]
    @song.uri = params[:uri]

    if @song.save
      flash[:notice] = "Added song to playlist."
    else
      flash[:alert] = "There was a problem saving the song."
    end
    redirect_to(race_path(params[:race_id]))


    # @song = Song.new(song_params)

    # respond_to do |format|
    #   if @song.save
    #     format.html { redirect_to @song, notice: 'Song was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @song }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @song.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /songs/1
  # PATCH/PUT /songs/1.json
  def update
    respond_to do |format|
      if @song.update(song_params)
        format.html { redirect_to @song, notice: 'Song was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /songs/1
  # DELETE /songs/1.json
  def destroy
    @song.destroy
    respond_to do |format|
      format.html { redirect_to songs_url }
      format.json { head :no_content }
    end
  end

  protected

    def find_playlist
      @playlist = Playlist.find(params[:playlist_id])
    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song
      @song = Song.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_params
      params.require(:song).permit(playlist_ids: [])
    end
end
