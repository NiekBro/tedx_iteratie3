class CirclesController < ApplicationController
  def index
  end

  def show
  	@circle = by_type params[:id], type(params[:id])
  	@circle.video = Video.find_by_youtube_id(params[:id])
  end

  def create
  end

  def new
  end

  def comment
  	commentable = Circle.find(params[:id].to_i)
	commentable.comments.create(:title => params[:title], :comment => params[:comment], :user => current_user())
	redirect_to :back
  end

  def rate
	value = params[:type] == "up" ? 1 : -1
	rateable = Circle.find(params[:id].to_i)
	rateable.add_or_update_evaluation(:votes, value, current_user)
  	redirect_to :back
  end

  private
  def type id = params[:id]
  	unless(Video.find_by_youtube_id(id).nil?)
  		return 'video'
  	end
  end

  def by_type id = params[:id], type
	unless Circle.find_by_unique_id(id).nil?
		return Circle.find_by_unique_id(id)
	else
		return Circle.create([{:unique_id => id,:circle_type => type}]).first
	end
  end
end
