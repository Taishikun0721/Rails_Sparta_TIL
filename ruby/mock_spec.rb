require_relative './mock'
require 'rspec/autorun'
require 'byebug'

RSpec.describe 'random' do
  it 'generates a random number' do
    generator_mock = double('generator_mock_test')
    allow(generator_mock).to receive(:rand).and_return('AAAAA')
    generator = NumberGenerator.new
    allow(generator).to receive(:random).and_return(generator_mock.rand)
    expect(generator.random).to eq('AAAAA')
  end
end