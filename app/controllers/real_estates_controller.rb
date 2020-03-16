class RealEstatesController < ApplicationController
  before_action :set_real_estate, only: [:show, :edit, :update, :destroy]

  def index
    @reals = RealEstate.all
  end

  def new
    @real = RealEstate.new
    2.times { @real.nearest_stations.new }
  end

  def show

  end

  def edit
    @real.nearest_stations.new
  end

  def create
    @real = RealEstate.new(real_estate_params)
    if @real.save
      redirect_to real_estate_path(@real), notice: "物件を登録しました。"
    else
      2.times { @real.nearest_stations.new }
      render "new"
    end
  end

  def update
    if @real.update(real_estate_params)
      redirect_to real_estate_path(@real), notice: "物件を変更しました。"
    else
      @real.nearest_stations.new
      render "edit"
    end
  end

  def destroy
    @real.destroy
    redirect_to real_estates_path, notice: "物件を削除しました。"
  end

  private

  def set_real_estate
    @real = RealEstate.find(params[:id])
  end

  def real_estate_params
    params.require(:real_estate).permit(
      :real_estate_name,
      :rent,
      :address,
      :age,
      :remarks,
      nearest_stations_attributes: [
        :id,
        :route_name,
        :station_name,
        :minutes_on_foot,
      ]
    )
  end
end
