class PropertiesController < ApplicationController
  before_action :set_property, only: %i(show update destroy)

  def index
    @properties = PropertyQuery.new(property_query_params).query

    render json: { found_properties: @properties.size, properties: @properties }
  end

  def create
    @property = Property.new(property_params)

    if @property.save
      render json: @property, status: :created, location: @property
    else
      render json: @property.errors, status: :unprocessable_entry
    end
  end

  def show
    render json: @property
  end

  private
  def set_property
    @property = Property.find(params[:id])
  end

  def property_params
    params.require(:property).permit(:x, :y, :title, :price, :description, :beds, :baths, :square_meters)
  end

  def property_query_params
    params.permit(:ax, :ay, :bx, :by)
  end
end
