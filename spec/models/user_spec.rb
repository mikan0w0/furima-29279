require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context '登録がうまくいくとき'
      it "各項目が必須であること" do
        expect(@user).to be_valid
      end
      it "メールアドレスは@を含む必要性があること" do
        expect(@user.email).to include("@")
      end
      it "passwordが6文字以上であれば登録できること" do
        @user.password = "000000"
        @user.password_confirmation = "000000"
        expect(@user).to be_valid
      end
    end

    context '登録がうまくいかないとき' do
      it "nicknameが空では登録できないこと" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できないこと" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "passwordが空では登録できないこと" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end  
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "00000"
        @user.password_confirmation = "00000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end     
      it "メールアドレスが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "名前（名字）が空では登録できない" do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First_name can't be blank")
      end
      it "名前が（名前）がからでは登録できない" do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_name can't be blank")
      end
      it "カナ（名字）が空では登録できない" do
        @user.first_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First_kana can't be blank")
      end
      it "カナ（名前）が空では登録できない" do
        @user.family_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Family_kana can't be blank")
      end

    end
  end
end
