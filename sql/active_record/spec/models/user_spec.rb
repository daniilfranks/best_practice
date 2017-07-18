require_relative '../spec_helper'

describe 'class User' do
  let(:den) { User.new(name: 'Deny', jobs: 100) }

   describe 'inheritence' do
     it 'inherits from ActiveRecord::Base' do
       expect(User.superclass).to eq(ActiveRecord::Base)
     end
   end

   describe 'atributes' do
     it 'has a name and a breed' do
       expect(den.name).to eq('Deny')
       expect(den.jobs).to eq(100)
     end
   end

   describe '.create' do
     it 'create user' do
       user = User.create(name: 'Fox', jobs: 900)
       expect(user.id).to eq(1)
     end
   end

   describe '.save' do
     it 'create object and save on db' do
       user = User.new(name: 'Zoom', jobs: 10000)
       user.save

       expect(user.id).to eq(1)
     end
   end

   describe '.update' do
     it 'update user name' do
       asd = User.new(name: 'Asd', jobs: 45)
       asd.save
       asd.update({name: 'ASD'})
       search_name = User.find_by_name('ASD')

       expect(search_name.id).to eq(asd.id)
     end
   end
end
