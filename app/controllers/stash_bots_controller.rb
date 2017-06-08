class StashBotsController < ApplicationController
  before_action :set_stash_bot, only: [:show, :edit, :update, :destroy]

  # GET /stash_bots
  # GET /stash_bots.json
  def index
    @stash_bots = StashBot.all
  end

  # GET /stash_bots/1
  # GET /stash_bots/1.json
  def show
  end

  # GET /stash_bots/new
  def new
    @stash_bot = StashBot.new
  end

  # GET /stash_bots/1/edit
  def edit
  end

  # POST /stash_bots
  # POST /stash_bots.json
  def create
    @stash_bot = StashBot.new(stash_bot_params)

    respond_to do |format|
      if @stash_bot.save
        format.html { redirect_to @stash_bot, notice: 'Stash bot was successfully created.' }
        format.json { render :show, status: :created, location: @stash_bot }
      else
        format.html { render :new }
        format.json { render json: @stash_bot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stash_bots/1
  # PATCH/PUT /stash_bots/1.json
  def update
    respond_to do |format|
      if @stash_bot.update(stash_bot_params)
        format.html { redirect_to @stash_bot, notice: 'Stash bot was successfully updated.' }
        format.json { render :show, status: :ok, location: @stash_bot }
      else
        format.html { render :edit }
        format.json { render json: @stash_bot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stash_bots/1
  # DELETE /stash_bots/1.json
  def destroy
    @stash_bot.destroy
    respond_to do |format|
      format.html { redirect_to stash_bots_url, notice: 'Stash bot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def posts
    @stashes ||= StashBot.posts_by(params[:bid])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stash_bot
      @stash_bot = StashBot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stash_bot_params
      params.require(:stash_bot).permit(:name, :secret_code, :prefs)
    end
end
