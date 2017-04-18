class AdvertismentsController < ApplicationController
  def index
    @advertisments = Advertisment.all
  end

  def show
    @advertisment = Advertisment.find(params[:id])
  end

  def new
    @advertisment = Advertisment.new
  end

  def create
    @advertisment = Advertisment.new
    @advertisment.title = params[:advertisment][:title]
    @advertisment.body = params[:advertisment][:body]
    @advertisment.price = params[:advertisment][:price]

    if @advertisment.save
      flash[:notice] = "Ad was saved."
      redirect_to @advertisment
    else
      flash.now[:alert] = "There was an error saving the Ad. Please try again."
      render :new
    end

  end
end
