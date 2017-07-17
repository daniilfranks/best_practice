require 'spec_helper'

describe 'class User' do
  before :each do
    DB.execute('DROP TABLE IF EXISTS users')
    DB.execute('CREATE TABLE IF NOT EXISTS users(
               id    integer PRIMARY KEY,
               name  text    UNIQUE NOT NULL,
               jobs  integer DEFAULT 0
    	      )')
    DB.results_as_hash = true
  end

  let(:atrributes) { { id: nil, name: 'Den', jobs: 1200 } }
  let(:user) { User.new(atrributes) }

  context 'initialize' do
    it 'creates an new user' do
      expect(User.new).to be_a User
    end

    it 'creates a new user with attributes' do
      expect(user.name).to eq('Den')
    end

    it 'update attr_accessors name' do
      user.name = 'Leo'
      expect(user.name).to eq('Leo')
    end

    it 'update attr_accessors jobs' do
      user.jobs = 100
      expect(user.jobs).to eq(100)
    end
  end

  context '.table_name' do
  	it 'inherits from MyActiveRecord class' do
      expect(User).to be < MyActiveRecord
    end

    it 'db name' do
      expect(User.table_name).to eq('users')
    end
  end

  context '.column_names' do
    it 'return colum table' do
      expect(User.column_names).to eq(['id', 'name', 'jobs'])
    end
  end

  context '.col_names_for_insert' do
    it 'return colume methods' do
      expect(User.new.col_names_for_insert).to eq("name, jobs")
    end

    it 'does not include an id column' do
      expect(user.col_names_for_insert).not_to include('id')
    end
  end

  context '.values_for_insert' do
    it 'return colume methods' do
      expect(user.values_for_insert).to eq("'Den', '1200'")
    end
  end

  context '.table_name' do
  	it 'db name' do
      expect(User.new.table_name_for_insert).to eq('users')
    end
  end

  context '#save' do
    it 'save the user to the db' do
      user.save
      sql = "SELECT * FROM users WHERE name = 'Den'"

      expect(DB.execute(sql)).to eq([{"id"=>1, "name"=>"Den", "jobs"=>1200, 0=>1, 1=>"Den", 2=>1200}])
    end
  end

  context '.find_by_name' do
  	it 'find user' do
      User.new({ name: 'Leo', jobs: 500 }).save
      expect(User.find_by_name('Leo')).to eq([{"id"=>1, "name"=>"Leo", "jobs"=>500, 0=>1, 1=>"Leo", 2=>500}])
    end
  end
end
