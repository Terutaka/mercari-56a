class ItemsController < ApplicationController
  before_action :set_category

  def index
    @items = Item.all
    @photos = Photo.all
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
    if @item.save
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

  def edit
  end

  def destroy
    if @item.destroy
      redirect_to action: "index"
    else
      flash[:notice] = "削除に失敗しました"
    end
  end

  def set_item
    @item = Item.find(params[:id])
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
