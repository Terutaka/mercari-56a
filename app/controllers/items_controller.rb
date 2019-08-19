class ItemsController < ApplicationController

  def index
    # @items = Item.order("created_at DESC").limit(4)
    @items = Item.first
    # @photos = Photo.includes(:item)
    @photos = Photo.all
    # @oreos = @photos.@nanasi.all
    # @oreos = Item.all.includes(:photos)
  end

  def show
  end
end
