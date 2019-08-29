require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    before do
      @item = FactoryBot.create(:item)
    end
    it "nameが空白だと無効" do
    end
    it "nameが30文字以内だと有効" do
    end
    it "nameが31文字以上だと無効" do
    end
    it "explainが空白だと無効" do
    end
    it "explainが1000文字以内だと有効" do
    end
    it "explainが1001文字以上だと無効" do
    end
    it "category_id空白だと無効" do
    end
    it "state_idが空白だと無効" do
    end
    it "fee_side_idが空白だと無効" do
    end
    it "shipping_date_idが空白だと無効" do
    end
    it "priceが空白だと無効" do
    end
    it "priceが数値だと有効" do
    end
    it "priceが数値以外だと無効" do
    end
    it "priceが300だと有効" do
    end
    it "priceが299だと無効" do
    end
    it "priceが9999999だと有効" do
    end
    it "priceが10000000だと無効" do
    end
    it "prefecture_idが空白だと無効" do
    end
    it "saler_idが空白だと無効" do
    end
  end
end
