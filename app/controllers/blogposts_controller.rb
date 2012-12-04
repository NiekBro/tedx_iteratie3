class BlogpostsController < ApplicationController
  def index
  	@blogposts = Blogpost.find_with_reputation(:votes, :all, order: "votes desc")
  	session[:return_to] ||= request.url
  end
  def comment
  	commentable = Blogpost.find(params[:blogpost_id].to_i)
	commentable.comments.create(:title => params[:title], :comment => params[:comment], :user => current_user())
	redirect_to session[:return_to]
  end
  def tag_list
  	taggable = Blogpost.find(params[:blogpost_id].to_i)
  	taggable.tag_list = params[:tag_list]
  	taggable.save
  	redirect_to session[:return_to]
  end
  def rate
	value = params[:type] == "up" ? 1 : -1
	rateable = Blogpost.find(params[:id].to_i)
	rateable.add_or_update_evaluation(:votes, value, current_user)
  	redirect_to session[:return_to]
  end
end
