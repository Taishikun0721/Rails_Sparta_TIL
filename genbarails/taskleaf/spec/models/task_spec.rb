require 'rails_helper'

RSpec.describe Task, type: :model do

  let(:user) { FactoryBot.create(:user) }
  let(:task) { FactoryBot.create(:task, user: user) }

  describe 'validation test' do
    #
    # it 'is valid without name' do
    #   task.name = nil
    #   task.valid?
    #   expect(page).to include '名前なし'
    # end
  end
end
