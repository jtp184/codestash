require 'onebox'

class PostController < ApplicationController
  def create_post
  	new_stash = Stash.new
  	new_stash.code = Code.find(params[:cid])
  	new_stash.save
  	session[:stash_id] = new_stash.id
  	redirect_to controller: 'stash_elements', action: "new", kind: 'author'
  end

  def author
    @stash = Stash.find(session[:stash_id])
  end

  def new_post
  	@stash = Stash.find(session[:stash_id])
  	@elements = @stash.stash_elements
  end

  def add_item
    @stash = Stash.find(session[:stash_id])
    @stash_element = StashElement.new
    @stash_element.stash = @stash
  end

  def cancel_add_item
    to_remove = StashElement.find(params[:eid])
    to_remove.destroy
    redirect_to action: 'new_post'
  end

  def view
    @stash = Stash.find(params[:id])
    @elements = @stash.stash_elements
  end

  def post_sms
    number = params[:tel]
    result = "sms:#{number}"
  end

  def post_location
  end

  def finish_post
    the_stash = Stash.find(session[:stash_id])
    the_stash.finalized = true
    the_stash.save
    redirect_to controller: 'code_lookup', action: 'show', cid: the_stash.code_id
  end

  def cancel_post
    the_stash = Stash.find(session[:stash_id])
    the_stash.destroy
    redirect_to controller: 'code_lookup', action: 'show', cid: the_stash.code_id
  end

  def img_from_kind
  	""
  end
end
