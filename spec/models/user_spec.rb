require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is the name valid' do
    user = User.new(name: 'Youssef')
    expect(user).to be_valid
  end

  it 'is the name invalid' do
    user = User.new(name: nil)
    user.valid?
    expect(user.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a name less than 2 characters' do
    user = User.new(name: 'Y')
    user.valid?
    expect(user.errors[:name]).to include('is too short (minimum is 2 characters)')
  end

  it 'is invalid with a name longer than 50 characters' do
    user = User.new(name: 'Y' * 51)
    user.valid?
    expect(user.errors[:name]).to include('is too long (maximum is 50 characters)')
  end
end
