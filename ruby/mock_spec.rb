require_relative './mock'
require 'rspec/autorun'

RSpec.describe 'random' do
  it 'generates a random number' do
    generator = NumberGenerator.new
    allow(generator).to receive(:rand).and_return(5)
    expect(generator.random).to eq('AAAAA')
  end
end