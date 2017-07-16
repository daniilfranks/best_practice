require 'spec_helper'

describe 'class User' do
  #let(:user) { User.new }

  context '#all' do
  	it 'not raise error' do
      expect{ @db.execute(user.all) }.to_not raise_error
  	end

    it 'Extract all users from db' do
      expect(@db.execute(user.all).size).to eq(8)
    end

    it 'views first user' do
      expect(@db.execute(user.all)[0]).to eq([1, "Den", 7, 319, 98])
    end

    it 'views all users' do
      expect(@db.execute(user.all)).to eq([[1, "Den", 7, 319, 98], [2, "Alan", 10, 810, 87], [3, "Leo", 1, 2, 99], [4, "Mark", 2, 3, 100], [5, "Jok", 6, 1800, 95], [6, "Ahmed", 16, 300, 50], [7, "Valera", 4, 11, 70], [8, "Enot", 1, 1, 100]])
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
