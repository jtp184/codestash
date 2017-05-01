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

  def add_item
    @stash = Stash.find(session[:stash_id])
    @this_element = StashElement.new
    @stash.stash_elements << @this_element
  end

  def cancel_add_item
    to_remove = StashElement.find(params[:eid])
    to_remove.destroy
    redirect_to action: 'new_post'
  end

  def view
  end

  def post_sms
    number = params[:tel]
    result = "sms:#{number}"
  end

  def post_location
  end

  def finish_post
    redirect_to controller: code, action: show, cid: Stash.finish(session[:stash_id])
  end

  def cancel_post
    redirect_to controller: code, action: show, cid: Stash.cancel(session[:stash_id])
  end

  def img_from_kind
  	""
  end
end
