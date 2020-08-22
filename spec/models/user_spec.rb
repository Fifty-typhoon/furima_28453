require 'rails_helper'
RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    it "nicknameが空だと登録できない" do
      #user = User.new(nickname: "", encrypted_email: "kkk@gmail.com", password: "0912oiqw", first_name: "剛田", last_name: "武", kana_first_name: "ゴウダ", kana_last_name: "タケシ", birthday: "2000/1/1")
      #user.valid?
    end
    it "encrypted_emailが空だと登録できない" do
    end
    it "passwordが空だと登録できない" do
    end
    it "password_confirmationが空だと登録できない" do
    end
    it "first_nameが空だと登録できない" do
    end
    it "last_nameが空だと登録できない" do
    end
    it "kana_first_nameが空だと登録できない" do
    end
    it "kana_last_nameが空だと登録できない" do
    end
    it "birthdayが空だと登録できない" do
    end
  end
end
