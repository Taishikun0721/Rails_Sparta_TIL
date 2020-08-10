require 'rails_helper'

describe 'task', type: :system do

    let(:user_a) { FactoryBot.create(:user)}
    let(:user_b) {FactoryBot.create(:user, name: 'Ruby Rails', password: 'password2', password_confirmation: 'password2') }
    let(:task) { FactoryBot.create(:task, user: user_a) }

    shared_examples_for 'showing the task that user_a made' do
      it { expect(page).to have_content task.description }
    end

  describe '#index' do
    describe 'check data is set up' do
      it 'has correct user' do
        user_a.valid?
        expect(user_a).to be_valid
      end

      it 'has correct project' do
        task.valid?
        expect(task).to be_valid
      end
    end

    # sign_in_asメソッドはspec/support/login_support.rbに定義
    context 'as an authenticated user' do
      let(:login_user_a) { user_a }
      let(:login_user_b) { user_b }

      before do
        sign_in_as login_user_a
      end

      it 'is successfully login' do
        expect(page).to have_content 'タスク一覧'
      end

      it 'is not show the content to other user' do
        visit new_task_path
        create_task(task)
        expect(page).to have_content task.description
        sign_in_as login_user_b
        expect(page).to_not have_content task.description
      end
    end
  end

  describe '#show' do
    let(:login_user_a) { user_a }
    context 'in case of user_a is login' do

      before do
        sign_in_as login_user_a
        create_task(task)
        visit task_path(task)
      end

      it_behaves_like 'showing the task that user_a made'
    end
  end


    describe '#create' do

      let(:login_user) { user_a }

      before do
        sign_in_as login_user
        visit new_task_path
        fill_in '名前', with: task_name
        fill_in '詳しい説明', with: task.description
        click_button '登録する'
      end

      context '新規登録画面で入力した時' do
        let(:task_name) { '新規作成のテストを書く' }

        it '正常に登録される' do
          expect(page).to have_selector '.alert-success', text: '新規作成のテストを書く'
        end
      end

      context "when doesnt exists name filling in task's form" do
        let(:task_name) { '' }

        it 'happens to callback which is insert no name' do
          expect(page).to have_content '名前なし'
        end
      end


    end
end