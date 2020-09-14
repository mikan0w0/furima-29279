require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

    #新規登録ができるとき
  describe 'ユーザー新規登録' do
    context '新規登録ができる時' do
      it "各項目が必須であること" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できること" do
        @user.password = "aa00000"
        @user.password_confirmation = "aa00000"
        expect(@user).to be_valid
      end
    end
    #新規登録ができないとき  
    context '新規登録ができない時' do
      it "nicknameが空では登録できないこと" do
        @user.nickname = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できないこと" do
        @user.email = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに＠が含まれないと登録できないこと" do
        @user.email = "mikanmikan"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "passwordが空では登録できないこと" do
        @user.password = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
        @user.password_confirmation = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end  
      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "a0000"
        @user.password_confirmation = "a0000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが数字のみでは登録できないこと" do
        @user.password = "0000000"
        @user.password_confirmation = "0000000"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて6文字以上で設定してください")
      end
      it "passwordが英字のみでは登録できないこと" do
        @user.password = "aaaaaaa"
        @user.password_confirmation = "aaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password には英字と数字の両方を含めて6文字以上で設定してください")
      end
      it "メールアドレスが一意性であること" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "名前（名字）が空では登録できない" do
        @user.first_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it "名前が（名前）が空では登録できない" do
        @user.family_name = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name can't be blank")
      end
      it "カナ（名字）が空では登録できない" do
        @user.first_kana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana can't be blank")
      end
      it "カナ（名前）が空では登録できない" do
        @user.family_kana = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana can't be blank")
      end
      it "生年月日が空では登録できない" do
        @user.birth_date = " "
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
      it "名前（名字）は全角でないといけない" do
        @user.first_name = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name 全角文字を使用してください")
      end
      it "名前（名前）は全角でないといけない" do
        @user.family_name = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family name 全角文字を使用してください")
      end
      it "カナ（名字）はカタカナでないといけない" do
        @user.first_kana = "yamada"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana カタカナを使用してください")
      end
      it "カナ（名前）はカタカナでないといけない" do
        @user.family_kana = "tarou"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana カタカナを使用してください")
      end
      it "カナ（名字）は全角でないといけない" do
        @user.first_kana = "ﾔﾏﾀﾞ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First kana カタカナを使用してください")
      end
      it "カナ（名前）は全角でないといけない" do
        @user.family_kana = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Family kana カタカナを使用してください")
      end

    end
  end
end
