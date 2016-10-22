class VotesController < ApplicationController
  before_action :current_user_must_be_vote_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_vote_user
    vote = Vote.find(params[:id])

    unless current_user == vote.fan
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @votes = Vote.all
  end

  def show
    @vote = Vote.find(params[:id])
  end

  def new
    @vote = Vote.new
  end

  def create
    @vote = Vote.new
    @vote.fan_id = params[:fan_id]
    @vote.photo_id = params[:photo_id]

    if @vote.save
      redirect_to "/votes", :notice => "Vote created successfully."
    else
      render 'new'
    end
  end

  def edit
    @vote = Vote.find(params[:id])
  end

  def update
    @vote = Vote.find(params[:id])

    @vote.fan_id = params[:fan_id]
    @vote.photo_id = params[:photo_id]

    if @vote.save
      redirect_to "/votes", :notice => "Vote updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @vote = Vote.find(params[:id])

    @vote.destroy

    redirect_to "/votes", :notice => "Vote deleted."
  end
end
