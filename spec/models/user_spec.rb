require 'rails_helper'

describe User do
  describe '#create' do
    describe 'SUCCESS' do
      it "user登録" do
        user = build(:user)
        expect(user).to be_valid
      end
      it "nicknameが6文字以下" do
        user = build(:user, nickname: "aaaaaa")
        expect(user).to be_valid
      end
      it "passwordが6文字以上" do
        user = build(:user, password: "abcdef", password_confirmation: "abcdef")
        expect(user).to be_valid
      end
    end
    describe 'ERROR' do
      it "nicknameが空" do
        user = build(:user, nickname: "")
        user.valid?
        expect(user.errors[:nickname]).to include("can't be blank")
      end
      it "emailが空" do
        user = build(:user, email: "")
        user.valid?
        expect(user.errors[:email]).to include("can't be blank")
      end
      it "passwordが空" do
        user = build(:user, password: "", password_confirmation: "")
        user.valid?
        expect(user.errors[:password]).to include("can't be blank")
      end
      it "passwordとpassword_confirmationが不一致" do
        user = build(:user, password_confirmation: "")
        user.valid?
        expect(user.errors[:password_confirmation]).to include("doesn't match Password")
      end
      it "nicknameが7文字以上" do
        user = build(:user, nickname: "aaaaaaa")
        user.valid?
        expect(user.errors[:nickname]).to include("is too long (maximum is 6 characters)")
      end
      it "重複したemailが存在する" do
        user1 = create(:user, email: "aaa@aaa.aaa")
        user2 = build(:user, email: "aaa@aaa.aaa")
        user2.valid?
        expect(user2.errors[:email]).to include("has already been taken")
      end
      it "passwordが5文字以下" do
        user = build(:user, password: "aaaaa", password_confirmation: "aaaaa")
        user.valid?
        expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
      end
    end
  end
end
