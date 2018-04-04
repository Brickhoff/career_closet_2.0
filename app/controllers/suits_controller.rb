class SuitsController < ApplicationController
    helper_method :sort_column, :sort_direction
  
  def index
    @suits = Suit.order(sort_column + " " + sort_direction)
  end
  
  def show
    @suit = Suit.find(params[:id])
  end
  
  def new
    @suit = Suit.new
  end
  
  def create
    @suit = Suit.new(params[:product])
    if @suit.save
      flash[:notice] = "Successfully created suit."
      redirect_to @suit
    else
      render :action => 'new'
    end
  end
  
  def edit
    @suit = Suit.find(params[:id])
  end
  
  def update
    @suit = Suit.find(params[:id])
    if @suit.update_attributes(params[:product])
      flash[:notice] = "Successfully updated suit."
      redirect_to @suit
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @suit = Suit.find(params[:id])
    @suit.destroy
    flash[:notice] = "Successfully destroyed suit."
    redirect_to suits_url
  end
  
  private
  
  def sort_column
    Suit.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
