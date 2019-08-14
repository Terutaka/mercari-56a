class ItemsController < ApplicationController

  def index
    # @parents = Category.all.order("id ASC").limit(13)
  end

<
  def new
    @item = Item.new
    @item.photos.build
  end

  def create
    @item = Item.new(name: 'aaa',explain: 'bbbbb',state: '1',fee_side: '1',prefecture_id: '1',shipping_date: '1',price: '9999',category_id: '1',photo_id: '1',size: '1',brand_id: '1',seller_id: '1',buyer_id: '1',likes_count: '1')
    # @item += (name: 'aaa',explain: 'bbbbb',state: '1',fee_side: '1',prefecture_id: '1',shipping_date: '1',price: '9999',category_id: '1',photo_id: '1',size: '1',brand_id: '1',seller_id: '1',buyer_id: '1',likes_count: '1')
    if @item.save!
    else
      render :index
    end
  end

  def show
    
  end
  private

  # def create_params
  #   params.require(:item).permit(:name,:explain,:state,:fee_side,:prefecture_id,:shipping_date,:price,:category_id)
  # end

end
