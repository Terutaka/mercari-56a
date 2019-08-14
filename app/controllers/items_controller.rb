class ItemsController < ApplicationController

  def index
    # @parents = Category.all.order("id ASC").limit(13)
    @items = Item.order("created_at DESC").limit(4)
  end

  def show
    
  end
end
