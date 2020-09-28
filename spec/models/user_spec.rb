require 'rails_helper'

RSpec.describe User, type: :model do

  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it "nicknameとemail、passwordとpassword_confirmationなどが存在すれば登録できること" do
      expect(@user).to be_valid
    end

    it 'nicknameが空だと保存できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailがからでは登録できない" do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it "first_nameが空では登録できないこと" do
      @user.first_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it "last_nameが空では登録できないこと" do
      @user.last_name = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it "birthdayが空では登録できないこと" do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end

    it "last_name_kanaが空では登録できないこと" do
      @user.last_name_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it "first_name_kanaが空では登録できないこと" do
      @user.first_name_kana =  nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "passwordが空では登録できないこと" do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it "passwordが存在してもpassword_confirmationが空では登録できないこと" do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it "重複したemailが存在する場合登録できないこと" do
      @user.save
      another_user = build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it "passwordが6文字以上であれば登録できること" do
      @user.password = "aaa111"
      @user.password_confirmation = "aaa111"
      expect(@user).to be_valid
    end

    it "passwordが5文字以下であれば登録できないこと" do
      @user.password = "12345"
      @user.password_confirmation = "12345"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'last_name_kanaがカタカナで返ること' do
      @user.last_name_kana = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana full-width characters.")
    end

    it 'first_name_kanaがカタカナで返ること' do
      @user.first_name_kana = "kana"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana full-width characters.")
    end

    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.last_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name full-width characters.")
    end

    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.first_name = "aaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name full-width characters.")
    end

    it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' do
      @user.last_name_kana = "sssss"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana full-width characters.")
    end

    it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' do
      @user.first_name_kana = "sssss"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana full-width characters.")
    end
    
    it 'passwordは半角英数字混合であること' do
      @user.password = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password full-width characters.")
    end
    
    it 'emailには@が含まれない場合に登録できないこと' do
      @user.email = "aaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが英字のみだと登録できない' do
      @user.password = "AAA"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password full-width characters.")
    end

    it 'passwordが数字のみだと登録できない' do
      @user.password = "１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password full-width characters.")
    end
  end
end