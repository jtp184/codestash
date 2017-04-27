class PostController < ApplicationController
  def create_post
  	new_stash = Stash.new
  	new_stash.code = Code.find(params[:cid])
  	new_stash.save
  	session[:stash_id] = new_stash.id
  	redirect_to action: 'new_post'
  end

  def new_post
  	@stash = Stash.find(session[:stash_id])
  	@elements = @stash.stash_elements
  end

  def view
  end

  def finish_stash
  	Stash.finish(session[:stash_id])
  end
end
