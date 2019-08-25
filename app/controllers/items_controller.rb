class ItemsController < ApplicationController
  before_action :set_category

  def index
    # @items = Item.order("created_at DESC").limit(4)
    @items = Item.first
    # @photos = Photo.includes(:item)
    @photos = Photo.all
    # @oreos = @photos.@nanasi.all
    # @oreos = Item.all.includes(:photos)
  end

  def show
    @items = Item.first
    @brands = Brand.first
    @prefectures = Prefecture.first
    @categories = Category.first
  end

  def new
    @item = Item.new
    @item.photos.build
  end

  def create
    @item = Item.new(create_params)
    if @item.save!
      redirect_to action: 'new'
    else
      render :index
    end
  end


  private

  def create_params
    params.require(:item).permit(:brand_id,:name,:explain,:state_id,:fee_side_id,:prefecture_id,:shipping_date_id,:price,:category_id,photos_attributes: [:img_list]).merge(saler_id: 1)
  end

  def set_category
    @parents = Category.all.order("id ASC").where(ancestry: nil)
    @fee_side = ["あああ",1],["着払い（購入者負担）",2]
  end

end
