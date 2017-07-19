require_relative '../spec_helper'

describe 'class User' do
  let(:den) { User.new(name: 'Deny', jobs: 100) }

   context 'inheritence' do
     it 'inherits from ActiveRecord::Base' do
       expect(User.superclass).to eq(ActiveRecord::Base)
     end
   end

   context '::new' do
     it 'can be instantiated without any attributes' do
       expect{ User.new }.to_not raise_error
     end
   end

   context 'atributes' do
     it 'has a name and a breed' do
       expect(den.name).to eq('Deny')
       expect(den.jobs).to eq(100)
     end
   end

   context '.create' do
     it 'create user' do
       user = User.create(name: 'Fox', jobs: 900)
       expect(user.id).to eq(1)
     end

     it 'where user Fox' do
       create = User.create(name: 'Fox', jobs: 900)
       where = User.where(name: 'Fox').first

       expect(where.name).to eq(create.name)
     end
   end

   context '.save' do
     it 'create object and save on db' do
       user = User.new(name: 'Zoom', jobs: 10000)
       user.save

       expect(user.id).to eq(1)
     end
   end

   context '.update' do
     it 'update user name' do
       asd = User.new(name: 'Asd', jobs: 45)
       asd.save
       asd.update({name: 'ASD'})
       search_name = User.find_by_name('ASD')

       expect(search_name.id).to eq(asd.id)
     end
   end

   context '.find_or_create_by' do
     it 'create user if it does not already exist' do
       user1 = User.create(name: 'Zak', jobs: 10)
       user2 = User.find_or_create_by(name: 'Zak', jobs: 10)

       expect(user1.id).to eq(user2.id)
     end
   end

   context '.find_by_name' do
     it 'return user' do
       den.save
       den_from_db = User.find_by_name('Deny')

       expect(den_from_db.name).to eq('Deny')
       expect(den_from_db).to be_an_instance_of(User)
     end
   end

   context '.find_by_id' do
     it 'return user' do
       den.save
       den_from_db = User.find_by_id(1)

       expect(den_from_db.id).to eq(1)
       expect(den_from_db).to be_an_instance_of(User)
     end
   end

   context '#user_create_by_name' do
     it 'create user' do
       User.user_create_by_name('Den')
       user = User.where(name: 'Den').first

       expect(user.name).to eq('Den')
     end
   end

   context '#users_count' do
     it 'users count in db' do
       User.create(name: 'Leo')
       User.create(name: 'Den')
       User.create(name: 'Jok')

       expect(User.users_count).to eq(3)
     end
   end

   context '#find_first_name' do
     it 'find first name' do
       User.create(name: 'Leo')
       User.create(name: 'Den')

       expect(User.find_first_name).to eq('Leo')
     end
   end

   context '#find_using_where_clause_and_sorted' do
     it 'find users where 100' do
       User.create(name: 'Leo', jobs: 100)
       User.create(name: 'Den', jobs: 160)
       User.create(name: 'Jok', jobs: 50)
       User.create(name: 'Alan', jobs: 400)

       expect(User.find_using_where_clause_and_sorted.map{|n| n.name}).to eq(["Den", "Alan"])
     end
   end
end
