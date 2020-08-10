require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user)}
  let(:user1) { FactoryBot.create(:user)}

  describe 'validation test' do
    it 'is valid name, email, password created' do
      user.valid?
      expect(user).to be_valid
    end

    it 'is invalid without name' do
      user.name = nil
      user.valid?
      expect(user.errors[:name]).to include 'を入力してください'
    end

    it 'is invalid without email' do
      user.email = nil
      user.valid?
      expect(user.errors[:email]).to include 'を入力してください'
    end

    it 'is not allow to use same email' do
      user
      user1.email = user.email
      user1.valid?
      expect(user1.errors[:email]).to include 'はすでに存在します'
    end
  end
end
