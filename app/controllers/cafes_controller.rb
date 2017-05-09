class CafesController < ApplicationController
  def new
    @cafe = Cafe.new
  end

  def create
    @cafe = Cafe.new(cafe_attributes)

    if @cafe.save
      redirect_to cafes_path
    else
      flash[:error] = 'Something terrible has happened.'
      render :new
    end
  end

  def index
    @cafes = Cafe.all
  end

  def show
    @cafe = Cafe.find params[:id]
  end

  private

  def cafe_attributes
    params.require(:cafe).permit(:name, :description)
  end
end
