class StashElementsController < ApplicationController
  before_action :set_stash_element, only: [:show, :edit, :update, :destroy]

  # GET /stash_elements
  # GET /stash_elements.json
  def index
    # redirect_to controller: 'post', action: 'new_post'
  end

  # GET /stash_elements/1
  # GET /stash_elements/1.json
  def show
  end

  # GET /stash_elements/new
  def new
    @stash_element = StashElement.new
  end

  # GET /stash_elements/1/edit
  def edit
  end

  # POST /stash_elements
  # POST /stash_elements.json
  def create
    @stash_element = StashElement.new(stash_element_params)
    puts @stash_element.inspect

    respond_to do |format|
      if @stash_element.save
        format.html { redirect_to controller: 'post', action: 'new_post', notice: 'Success'}
        format.json { render :show, status: :created, location: @stash_element }
      else
        format.html { redirect_to controller: 'post', action: 'new_post', notice: 'Failure'}
        format.json { render json: @stash_element.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stash_elements/1
  # PATCH/PUT /stash_elements/1.json
  def update
   respond_to do |format|
    if @stash_element.save
      format.html { redirect_to controller: 'post', action: 'new_post', notice: 'Success'}
      format.json { render :show, status: :created, location: @stash_element }
    else
      format.html { redirect_to controller: 'post', action: 'new_post', notice: 'Failure'}
      format.json { render json: @stash_element.errors, status: :unprocessable_entity }
    end
  end
end

  # DELETE /stash_elements/1
  # DELETE /stash_elements/1.json
  def destroy
    @stash_element.destroy
    respond_to do |format|
      format.html { redirect_to controller: 'post', action: 'new_post', notice: 'Stash element was successfully created.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stash_element
      @stash_element = StashElement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stash_element_params
      params.require(:stash_element).permit('text_content', 'kind', 'file', 'stash_id')
    end
  end
