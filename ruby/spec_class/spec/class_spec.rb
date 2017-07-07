require 'spec_helper'
require_relative '../lib/class.rb'

describe 'class User' do
  it 'defined? class' do
    expect(defined?(User)).to be_truthy
    expect(User).to be_a(Class)
  end

  it 'defined variable class' do
    den = User.new
    expect(den).to be_a(User)
  end

  context '#hello' do
    it 'responds to the hello method' do
      den = User.new
      expect(den).to respond_to(:hello)
    end
  end

  context 'with names' do
    it '#name' do
      den = User.new
      den.name = 'Den'
      den.role = 1

      expect(den.name).to eq('Den')
      expect(den.role).to eq(1)
      expect(den.instance_variable_get(:@name)).to eq('Den')
    end
  end
end

describe 'class Role' do
  it 'defined? class' do
    expect(defined?(Role)).to be_truthy
    expect(Role).to be_a(Class)
  end

  it 'defined variable class' do
    moderator = Role.new
    expect(moderator).to be_a(Role)
  end

  context '#role' do
    it 'responds to the role method' do
      moderator = Role.new
      expect(moderator).to respond_to(:role)
    end
  end

  context 'with roles' do
    it '#name' do
      moderator = Role.new

      expect(moderator.instance_variable_set(:@name, 'Moderator')).to eq('Moderator')
    end
  end
end
