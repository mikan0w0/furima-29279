require 'rails_helper'

RSpec.describe OrderShipTo, type: :model do
  before do
    @order_ship_to = FactoryBot.build(:order_ship_to)
  end

  describe "商品購入機能" do
    context "商品購入ができる時" do
      it "各項目があれば購入できる" do
        expect(@order_ship_to).to be_valid
      end
      it "建物名がなくても購入できる" do
        @order_ship_to.building = ""
        expect(@order_ship_to).to be_valid
      end
    end

    context "商品購入ができない時" do
      it "tokenがないと購入できない" do
        @order_ship_to.token = ""
        @order_ship_to.valid?
        expect(@order_ship_to.errors.full_messages).to include("Token can't be blank")
      end
      it "post_codeが空だと購入できない" do
        @order_ship_to.post_code = ""
        @order_ship_to.valid?
        expect(@order_ship_to.errors.full_messages).to include("Post code can't be blank", "Post code is invalid. Include hyphen(-)")
      end
      it "post_codeはハイフンを含んだ正しい形式でないと購入できない" do
        @order_ship_to.post_code = 1234567
        @order_ship_to.valid?
        expect(@order_ship_to.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it "prefectureは選択してないと購入できない" do
        @order_ship_to.prefecture_id = 1
        @order_ship_to.valid?
        expect(@order_ship_to.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it "cityが空では購入できない" do
        @order_ship_to.city = ""
        @order_ship_to.valid?
        expect(@order_ship_to.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空だと購入できない" do
        @order_ship_to.address = ""
        @order_ship_to.valid?
        expect(@order_ship_to.errors.full_messages).to include("Address can't be blank")
      end
      it "phoneが空だと購入できない" do
        @order_ship_to.phone = ""
        @order_ship_to.valid?
        expect(@order_ship_to.errors.full_messages).to include("Phone can't be blank", "Phone is invalid")
     end
      it "phoneはハイフンなしでないと購入できない" do
        @order_ship_to.phone = 123-4567-8987
        @order_ship_to.valid?
        expect(@order_ship_to.errors.full_messages).to include("Phone is invalid")
      end
      it "phoneは9桁以下だと購入できない" do
        @order_ship_to.phone = 1234567
        @order_ship_to.valid?
        expect(@order_ship_to.errors.full_messages).to include("Phone is invalid")
      end
      it "phoneは12桁以上だと購入できない" do
        @order_ship_to.phone = 12345678
        @order_ship_to.valid?
        expect(@order_ship_to.errors.full_messages).to include("Phone is invalid")
      end
    end
  end
end
