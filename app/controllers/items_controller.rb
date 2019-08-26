class ItemsController < ApplicationController
  before_action :set_category

  def index
    # @items = Item.order("created_at DESC").limit(4)
    @items = Item.first
    # @photos = Photo.includes(:item)
    @photos = Photo.all
    @oreos = Item.all
    @oreophotos = Photo.all
    # @oreos = @photos.@nanasi.all
    # @oreos = Item.all.includes(:photos)
  end

  def show

  end

  def new
    @item = Item.new
    @item.photos.build
  end

  def create
    @item = Item.new(create_params)
    if @item.save
      # render :index
      redirect_to root_path
    else
      redirect_to action: 'new'
    end
  end

  def select
    if params[:parent_id]
      @children = Category.find(params[:parent_id]).children
    elsif params[:fee_parent_id]
      @fee_parent = FeeSide.find(params[:fee_parent_id]).children
    else
      @grandchildren = Category.find(params[:child_id]).children
    end
  end


  private

  def create_params
    params.require(:item).permit(:name,:explain,:state_id,:fee_side_id,:prefecture_id,:shipping_date_id,:price,:category_id,photos_attributes: [:img_list]).merge(saler_id: 1)
  end

  def set_category
    @parents = Category.all.order("id ASC").where(ancestry: nil)
    @fee_side = FeeSide.all.order("id ASC").where(ancestry: nil)
  end

end
