require 'rails_helper'

RSpec.describe Document, type: :model do
  before do
    @document = FactoryBot.build(:document)
  end

  describe Document do
    describe '新規文書登録' do
      context '新規文書登録ができるとき' do
        it '全ての項目が入力されていれば登録できること' do
          expect(@document).to be_valid
        end
      end

      context '新規文書登録ができないとき' do
        it 'titleが入力されていない場合は登録できないこと' do
          @document.title = ''
          expect(@document.errors[:title]).not_to include('を入力してください')
        end

        it 'titleが11文字以上で入力されている場合は登録できないこと' do
          @document.title = 'abcdefghijk'
          expect(@document.errors[:title]).not_to include('は10文字以内で入力してください')
        end

        it 'jurisdiction_departmentが入力されていない場合は登録できないこと' do
          @document.jurisdiction_department = ''
          expect(@document.errors[:jurisdiction_department]).not_to include('を入力してください')
        end

        it 'category_idが1を選択されている場合は登録できないこと' do
          @document.category_id = 1
          expect(@document.errors[:category_id]).not_to include('を選択してください')
        end

        it 'storage_period_idが1を選択されている場合は登録できないこと' do
          @document.storage_period_id = 1
          expect(@document.errors[:storage_period_id]).not_to include('を選択してください')
        end

        it 'storage_locationが入力されていない場合は登録できないこと' do
          @document.storage_location = ''
          expect(@document.errors[:storage_location]).not_to include('を入力してください')
        end

        it 'disposal_dateが入力されていない場合は登録できないこと' do
          @document.disposal_date = ''
          expect(@document.errors[:disposal_date]).not_to include('を入力してください')
        end

        it 'user_idが存在しない場合は出品できないこと' do
          @document.user_id = ''
          expect(@document.errors[:user_id]).not_to include('が存在していません')
        end
      end
    end
  end
end