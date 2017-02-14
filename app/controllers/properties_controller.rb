class PropertiesController < ApplicationController
  before_action :set_property, only: %i(show update destroy)

  def index
    @properties = Property.all

    render json: @properties
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entry
    end
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:x, :y, :tytle, :price, :description, :beds, :baths, :square_meters)
  end
end
