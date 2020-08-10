module LoginSupport
  def sign_in_as(user)
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'ログインする'
    click_link '新規登録'
  end

  def create_task(task)
    fill_in '名前', with: task.name
    fill_in '詳しい説明', with: task.description
    click_button '登録する'
  end
end

RSpec.configure do |config|
  config.include LoginSupport
end