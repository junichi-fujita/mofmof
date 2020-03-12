class RealEstatesController < ApplicationController
  before_action :set_real_estate, only: [:show, :edit, :update, :destroy]

  def index
    @real = Real_estate.all
  end

  def new
    @real = Real_estate.new
    @real.nearest_stations.new
  end

  def show

  end

  def edit
    @real.nearest_stations.new
  end

  def create
    @real = Real_estate.new(real_estate_params)
    if @real.save
      redirect_to real_estate_path(@real), notice: "物件を登録しました。"
    end
  end

  def update
    if @real.update(real_estate_params)
      redirect_to real_estate_path(@real), notice: "物件を変更しました。"
    else
      render "edit"
    end
  end

  def destroy
    @real.destroy
    redirect_to real_estates_path, notice: "物件を削除しました。"
  end

  private

  def set_real_estate
    @real = Real_estate.find(params[:id])
  end

  def real_estate_params
    params.require(:real).permit(
      :real_estate_name,
      :rent,
      :address,
      :age,
      :remarks,
      order_details_attributes: [
        :id,
        :route_name,
        :station_name,
        :minutes_on_foot,
      ]
    )
  end
end
