require 'spec_helper'

describe 'class User' do
  let(:user) { User.new }

  before do
    @db = connect_db
  end

  context '#all' do
  	it 'not raise error' do
      expect{ @db.execute(user.all) }.to_not raise_error
  	end

    it 'Extract all users from db' do
      expect(@db.execute(user.all).size).to eq(8)
    end
  end

  context '#user_max_jobs' do
    it 'select max jobs' do
      expect(@db.execute(user.user_max_jobs)[0]).to eq([16])
    end
  end

  context '#user_min_jobs' do
    it 'select min jobs' do
      expect(@db.execute(user.user_min_jobs)[0]).to eq([1])
    end
  end

  context '#user_avg_jobs' do
    it 'select avg jobs' do
      expect(@db.execute(user.user_avg_jobs)[0]).to eq([5.875])
    end
  end

  context '#user_sum_jobs' do
    it 'select sum jobs' do
      expect(@db.execute(user.user_sum_jobs)[0]).to eq([47])
    end
  end
end
