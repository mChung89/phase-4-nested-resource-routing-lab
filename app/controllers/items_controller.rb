class ItemsController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_no_found_response

  def index
    items = Item.all
    render json: items, include: :user
  end

  def show
    item = Item.find(params[:id])
    render json: item
  end

  private

  def render_no_found_response
    render json: {error: "Item not found" }, status: :not_found
  end

end
