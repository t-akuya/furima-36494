require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー管理機能' do
    it "nicknameが空だと登録できない" do
      user = User.new(nickname: " ")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it "emailが空では登録できない" do
      user = User.new(email: "")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it "passwordが空では登録できない" do
      user = User.new(password: "")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it "passwordとpassword_confirmationが不一致では空では登録できない" do
      user = User.new(password: "000000", password_confirmation: "111111")
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it "passwordが6文字以下では登録できない" do
      user = User.new(password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it "last_nameが空では登録できない" do
      user = User.new(last_name: "")
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it "first_nameが空では登録できない" do
      user = User.new(first_name: "")
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it "last_name_kanaが空では登録できない" do
      user = User.new(last_name_kana: "")
      user.valid?
      expect(user.errors.full_messages).to include("Last name kana can't be blank")
    end
    it "first_name_kanaが空では登録できない" do
      user = User.new(first_name_kana: "")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end
    it "birth_dayが空では登録できない" do
      user = User.new(birth_day: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birth day can't be blank")
    end
    

  end
end
