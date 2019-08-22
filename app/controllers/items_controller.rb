class ItemsController < ApplicationController
before_action :set_category
  def index

  end

  def new
    @item = Item.new
    @item.photos.build
  end
  
  def create
    @item = Item.new(create_params)
    if @item.save
      redirect_to action: 'new'
    else
      render :index
    end
  end

  def select
    if params[:parent_id]
      @children = Category.find(params[:parent_id]).children
    elsif params[:grand_id]
      @dection = Category.find(params[:grand_id])
    else
      @grandchildren = Category.find(params[:child_id]).children
    end
  end

  private

  def create_params
    params.require(:item).permit(:name,:explain,:state_id,:fee_side_id,:prefecture_id,:shipping_date_id,:price,:category_id,:brand_id,photos_attributes: [:img_list]).merge(saler_id: 1)
  end

  def set_category
    @parents = Category.all.order("id ASC").where(ancestry: nil)
    @fee_side = ["あああ",1],["着払い（購入者負担）",2]
  end

end
