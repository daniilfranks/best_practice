require 'spec_helper'
require_relative '../lib/class.rb'

describe 'class User' do
  it 'defined? class' do
    expect(defined?(User)).to be_truthy
    expect(User).to be_a(Class)
  end

  it 'defined variable class' do
    den = User.new('Den', Role.new)
    expect(den).to be_a(User)
  end

  context '#hello' do
    it 'responds to the hello method' do
      den = User.new('Den', Role.new)
      expect(den).to respond_to(:hello)
    end
  end

  context 'with names' do
    it '#name' do
      den = User.new('Den', Role.new)

      expect(den.name).to eq('Den')
      expect(den.role.role).to eq(1)
    end
  end
end

describe 'class Role' do
  it 'defined? class' do
    expect(defined?(Role)).to be_truthy
    expect(Role).to be_a(Class)
  end

  it 'defined variable class' do
    moderator = Role.new('Moderator', 2)
    expect(moderator).to be_a(Role)
  end

  context '#role' do
    it 'responds to the role method' do
      moderator = Role.new('Moderator', 2)
      expect(moderator).to respond_to(:role)
    end
  end

  context 'with roles' do
    it '#name' do
      moderator = Role.new

      expect(moderator.name).to eq('base')
    end
  end
end
