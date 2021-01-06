require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe User do
    describe 'ユーザー新規登録' do
      context '新規登録ができるとき' do
        it '全ての項目が入力されていれば登録できること' do
          expect(@user).to be_valid
        end
      end

      context '新規登録ができないとき' do
        it 'nameが入力されていない場合は登録できないこと' do
          @user.name = ''
          expect(@user.errors[:name]).not_to include('を入力してください')
        end

        it 'nameが9文字以上で入力されている場合は登録できないこと' do
          @user.name = 'abcdefghi'
          expect(@user.errors[:name]).not_to include('を入力してください')
        end

        it 'emailが入力されていない場合は登録できないこと' do
          @user.email = ''
          expect(@user.errors[:email]).not_to include('を入力してください')
        end

        it 'emailが@マークが含まれていないと登録できないこと' do
          @user.email = 'testexample'
          expect(@user.errors[:email]).not_to include('は不正な値です')
        end

        it '重複したemailが入力されている場合は登録できないこと' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          expect(another_user.errors[:email]).not_to include('はすでに存在します')
        end

        it 'passwordが入力されていない場合は登録できないこと' do
          @user.password = ''
          expect(@user.errors[:password]).not_to include('を入力してください')
        end

        it 'passwordが5文字以下の場合は登録できないこと' do
          @user.password = 'test1'
          @user.password_confirmation = 'test1'
          expect(@user.errors[:password]).not_to include('は6文字以上で入力してください')
        end

        it 'passwordが英語のみでは登録できないこと' do
          @user.password = 'testtest'
          @user.password_confirmation = 'testtest'
          expect(@user.errors[:password]).not_to include('は不正な値です')
        end

        it 'passwordが数字のみでは登録できないこと' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          expect(@user.errors[:password]).not_to include('は不正な値です')
        end

        it 'passwordが全角では登録できないこと' do
          @user.password = 'ｔｅｓｔ００００'
          @user.password_confirmation = 'ｔｅｓｔ００００'
          expect(@user.errors[:password]).not_to include('は不正な値です')
        end

        it 'passwordが存在してもpassword_confirmationが空では登録できない' do
          @user.password = 'test0000'
          @user.password_confirmation = ''
          expect(@user.errors[:password_confirmation]).not_to include('は不正な値です')
        end

        it 'departmentが入力されていない場合は登録できないこと' do
          @user.department = ''
          expect(@user.errors[:department]).not_to include('を入力してください')
        end
      end
    end
  end
end
